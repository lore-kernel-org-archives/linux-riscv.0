Return-Path: <SRS0=HL6o=A3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEDD5C433E7
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:19:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 880CB2076D
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2020 23:19:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="WzAySpLF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="yS1UlVCB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 880CB2076D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=dy95ad48KGoOV8vRczWvpHjw4NbbMwulkyF3Ageunak=; b=WzAySpLF0dwCLWnhbtvFTWHVn
	EFOdtHsMvsqCPItrTMtnLPRf+2+iAiBHUq4nlrsnZLQKDK33SJM0xNGWfSbnPq6IN/J1bJSX/1ty9
	XhUCrSndWoc8WWQ70gsgy4DXpffyZyzfNkFY1SVMyV8CrXL2A6Dx7pBgKvod6CxdLwxqfEhH66gI4
	MtpA4+pc8AMN/pbYaFG/5EkdYeKZK7SHakwKnxuxDa/Rgqm8vxKyeFZ87Nr0rjs6ceGIV2AcVycnu
	cyHO4M1yEHteu2Cpp3A7wfbtNoUW4DyyeUArdZb61f3TumUOlHgRxfzFKX72DlcHBDflH51KxPI2C
	IiTdE0ljg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jwD9w-0006Ww-Ba; Thu, 16 Jul 2020 23:19:24 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jwD9t-0006WO-ML
 for linux-riscv@lists.infradead.org; Thu, 16 Jul 2020 23:19:22 +0000
Received: by mail-pl1-x644.google.com with SMTP id p1so4580729pls.4
 for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2020 16:19:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=n4KTe3/xuQSWnZuouMggMmRt0/TA0hq7CmPqtl7gf30=;
 b=yS1UlVCB7/DevfhrSDlYG4yNIeaAteh3TMZPyrtc3jolPKCiHV225h1xQe5YOZhTlI
 BR/eM9E7fTCROcgjOezPXe0aal4ZJ7M6an23k9aHgb0dx97C5FuSCSOJdh8TbQjVpltg
 5g0POU6F1xR33zbXr4DVSSbz9khLkqi3MWw/vv1viWmmMJNJXq6468d0wU18kD6xtK1R
 0/Z3yP84fRQAKdNEEyZAQAxsTf6ex3B2PgElbg0682gaR0tZZmI0Zq2DPmhhr4d3FNuQ
 f3WcXzoDaEkz4ACVCg4qB1YI7nxsjxZx77Bf05P/dVN16z7F8sAO1vHDjeRTsipfLHFL
 OQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=n4KTe3/xuQSWnZuouMggMmRt0/TA0hq7CmPqtl7gf30=;
 b=XtUiKwfOyu5/D1KBQ8yW9cGY7IvSKNaHmrSvExQ1BztEj0rJ9RMe2Pf8+vS86QJ6Dc
 dlctEE12bLVxFYN1FxpgZkbxe4iBxqgRTfa2nfAMa59gqPxDfpLUnj5uFd12aj2zNhwB
 ZtEstm+RtMhg5cx40yjo23LLoPNEV+RelGCfyeDfGbrLq30x+8I7qmKrIZXGOlEwVu5N
 C6jkP6JP9vimQ9stvmal/2Eue+uGi5S/DYJK5lt00PIG/TD1V6Ec9U7o1A3JYBYb7ifH
 PmEtWHS7RVXr8k8FvRrged+vfRPmQBoDXHluCNaMkWVh505HH4gQKEwSy0gXmJC/TCsN
 qXUw==
X-Gm-Message-State: AOAM532JDIhoTomOj4FF8ldp2QjFfmpj6I4HVKPhYQMGSAfmScgurx60
 Gu2GI5zkwguSjGdnmbcSm+85usMVkTU=
X-Google-Smtp-Source: ABdhPJycqY6eAxKaeNeuobCKcFDl/A/Pm6poKCispycxj4QQknv/oWVgsDB75ASvN2wpr21lu4X37g==
X-Received: by 2002:a17:90a:f996:: with SMTP id
 cq22mr7779446pjb.208.1594941558995; 
 Thu, 16 Jul 2020 16:19:18 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id r25sm1627287pgv.88.2020.07.16.16.19.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 16:19:18 -0700 (PDT)
Date: Thu, 16 Jul 2020 16:19:18 -0700 (PDT)
X-Google-Original-Date: Thu, 16 Jul 2020 16:03:52 PDT (-0700)
Subject: Re: [PATCH] Replace HTTP links with HTTPS ones: RISC-V
In-Reply-To: <20200705220236.29402-1-grandmaster@al2klimov.de>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: grandmaster@al2klimov.de
Message-ID: <mhng-79889b3a-dda3-49ab-ba9b-0c20292c2c31@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200716_191921_885082_C32D16DB 
X-CRM114-Status: GOOD (  23.13  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 grandmaster@al2klimov.de, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv@lists.infradead.org, christian@brauner.io
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 05 Jul 2020 15:02:36 PDT (-0700), grandmaster@al2klimov.de wrote:
> Rationale:
> Reduces attack surface on kernel devs opening the links for MITM
> as HTTPS traffic is much harder to manipulate.
>
> Deterministic algorithm:
> For each file:
>   If not .svg:
>     For each line:
>       If doesn't contain `\bxmlns\b`:
>         For each link, `\bhttp://[^# \t\r\n]*(?:\w|/)`:
>           If both the HTTP and HTTPS versions
>           return 200 OK and serve the same content:
>             Replace HTTP with HTTPS.
>
> Signed-off-by: Alexander A. Klimov <grandmaster@al2klimov.de>
> ---
>  Continuing my work started at 93431e0607e5.
>
>  If there are any URLs to be removed completely or at least not HTTPSified:
>  Just clearly say so and I'll *undo my change*.
>  See also https://lkml.org/lkml/2020/6/27/64
>
>  If there are any valid, but yet not changed URLs:
>  See https://lkml.org/lkml/2020/6/26/837
>
>  arch/riscv/include/uapi/asm/unistd.h       | 2 +-
>  tools/arch/riscv/include/uapi/asm/unistd.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/uapi/asm/unistd.h b/arch/riscv/include/uapi/asm/unistd.h
> index 13ce76cc5aff..4b989ae15d59 100644
> --- a/arch/riscv/include/uapi/asm/unistd.h
> +++ b/arch/riscv/include/uapi/asm/unistd.h
> @@ -12,7 +12,7 @@
>   * GNU General Public License for more details.
>   *
>   * You should have received a copy of the GNU General Public License
> - * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.
>   */
>
>  #ifdef __LP64__
> diff --git a/tools/arch/riscv/include/uapi/asm/unistd.h b/tools/arch/riscv/include/uapi/asm/unistd.h
> index 0e2eeeb1fd27..f506cca520b0 100644
> --- a/tools/arch/riscv/include/uapi/asm/unistd.h
> +++ b/tools/arch/riscv/include/uapi/asm/unistd.h
> @@ -12,7 +12,7 @@
>   * GNU General Public License for more details.
>   *
>   * You should have received a copy of the GNU General Public License
> - * along with this program.  If not, see <http://www.gnu.org/licenses/>.
> + * along with this program.  If not, see <https://www.gnu.org/licenses/>.
>   */
>
>  #ifdef __LP64__

Thanks.  This is on for-next.

Unless anyone has any objections I'll eventually go remove all the license
boilerplates from arch/rsicv, as it looks like I missed a few when I converted
them over:

$ git grep "GNU" | grep riscv
arch/riscv/Makefile:# This file is subject to the terms and conditions of the GNU General Public
arch/riscv/boot/Makefile:# This file is subject to the terms and conditions of the GNU General Public
arch/riscv/boot/install.sh:# This file is subject to the terms and conditions of the GNU General Public
arch/riscv/include/uapi/asm/elf.h: * it under the terms of the GNU General Public License as published by
arch/riscv/kernel/fpu.S: *   modify it under the terms of the GNU General Public License
arch/riscv/kernel/fpu.S: *   GNU General Public License for more details.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
