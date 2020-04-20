Return-Path: <SRS0=WK8G=6E=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB30C3815B
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2020 16:40:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB4B720857
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2020 16:40:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BUKVVpoj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Mio6G/d+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BB4B720857
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MDsCJhRvyD2HDZUyUqMUbXbbPSm+BqJbdjnCx+/3isk=; b=BUKVVpojERJtbhmxxhIyU42vj
	Z4QJW2pjC91PRBZ8w99UxcfLzCOOqcqAGIlbseSinSBFFGh8I3jDtFr7ehGAty8zLvlsVzBAXk8fu
	YFeK1V3d6578285DtCwJp7uU4eoZogFAdtWOgL8XfJ2PE0Pu6dv9ZKsXchwoHttmz6CUt88ZCWr+y
	6E6d+PaKyzRJubKRq7z8bf6hPyFXORy8oElFii86Y7DDKUGXlj15edidXHPg3kRsW/8GptlMBvdkK
	31buTPXDXEWYJ0i/SP5KST+fCftxAenelOPs3HNErZgfJlIM2+SJItcUzhHJRY92FOssRnUv2QYok
	Z+FG7BNZA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQZSh-00015l-IV; Mon, 20 Apr 2020 16:39:59 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQZSf-00014n-12
 for linux-riscv@lists.infradead.org; Mon, 20 Apr 2020 16:39:58 +0000
Received: by mail-wr1-x442.google.com with SMTP id t14so12968415wrw.12
 for <linux-riscv@lists.infradead.org>; Mon, 20 Apr 2020 09:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=MDsCJhRvyD2HDZUyUqMUbXbbPSm+BqJbdjnCx+/3isk=;
 b=Mio6G/d+plzDhSx5s+S0EpXMBflvr+80zWrK5CtvFNNZc4GQ0QrMPAP/vS5+6O/wcC
 zjvXrNZrcqrSsQSl7KgSLTdMbClq7dMeEDQWp18ltxbjAjY3bmFkwK4NT0un5DeEX/rh
 QIcCcmPFcWiofIrphs/OcAnflXbF6ZIP4N8iBbPbybExKn0X27t99Nqr64T2X4DgDlCZ
 2y9SeRRLFO1Oy0Kmf3MpSUH53ZguvbiA0JVvoDumHOUhyYXzU//knZG6lJv/qIB+98xj
 d4qRBwhBCnVpVHXpW3wHQjKHWxhKzlavRA0d4wuHTJ0mctXRQZpIGLX5jPPuKI0HiqVH
 KaKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MDsCJhRvyD2HDZUyUqMUbXbbPSm+BqJbdjnCx+/3isk=;
 b=Xu5ZbZ91VilxIzObh71cg/0b2G4ojbGf9FCSehAes4aqoWam+UABXtEgBi4dlmMEF3
 tSzfC2MnpBAX080Y8GnLb9dnj7+rOpqNKAQHAUYpP9+zE0+QyG0jQzF7EEAQmjPoJE0P
 Lw3ymmFD0CUhBflup7F8FLkR/Hn7WoOjUm0ICqN2+H0R//hgewgW0sRIgp9K9TSF0hAc
 UoUu5VLXiHai1U8W98nx2t1LZ+q+HwlgBAsT3s27oMALIBete7tG93bNKcT1Z12bY/OL
 4AzAwRFx+7zK4zXggjz/7pthLt6vuSVvQXCHRdm1ktXbMi53iKwODjpjYCW9mbas6BAW
 TIGQ==
X-Gm-Message-State: AGi0PuYMTA1T9T13gBBMPVcJIT1KL8D/pVkzeu5YuvnLqFoAZ1YXYSzo
 vkIhRMLoICzvmKA3W+82dofuhQ==
X-Google-Smtp-Source: APiQypKS2iYpFCrXexj92Okt66EqZQ4BwgR5+LhedcaJQDZNlGA6Q27zuZ4ZUspB/z8YQT/sAn/eBw==
X-Received: by 2002:adf:ea44:: with SMTP id j4mr21185191wrn.38.1587400794742; 
 Mon, 20 Apr 2020 09:39:54 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net.
 [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id w12sm40508wrk.56.2020.04.20.09.39.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Apr 2020 09:39:54 -0700 (PDT)
Date: Mon, 20 Apr 2020 17:39:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Vincent Chen <vincent.chen@sifive.com>
Subject: Re: [PATCH v4 3/5] kgdb: enable arch to support XML packet support.
Message-ID: <20200420163952.yuqaemcdbrw7ewwe@holly.lan>
References: <1587004688-19788-1-git-send-email-vincent.chen@sifive.com>
 <1587004688-19788-4-git-send-email-vincent.chen@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1587004688-19788-4-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200420_093957_078633_ACFEE56D 
X-CRM114-Status: GOOD (  17.56  )
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 16, 2020 at 10:38:06AM +0800, Vincent Chen wrote:
> The XML packet could be supported by required architecture if the
> architecture defines CONFIG_HAVE_ARCH_KGDB_QXFER_PKT and implement its own
> kgdb_arch_handle_qxfer_pkt(). Except for the kgdb_arch_handle_qxfer_pkt(),
> the architecture also needs to record the feature supported by gdb stub
> into the kgdb_arch_gdb_stub_feature, and these features will be reported
> to host gdb when gdb stub receives the qSupported packet.
> 
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

Acked-by: Daniel Thompson <daniel.thompson@linaro.org>


> ---
>  include/linux/kgdb.h   | 11 +++++++++++
>  kernel/debug/gdbstub.c | 13 +++++++++++++
>  lib/Kconfig.kgdb       |  5 +++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index b072aeb1fd78..414bef20a8f3 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -177,6 +177,17 @@ kgdb_arch_handle_exception(int vector, int signo, int err_code,
>  			   struct pt_regs *regs);
>  
>  /**
> + *	kgdb_arch_handle_qxfer_pkt - Handle architecture specific GDB XML
> + *				     packets.
> + *	@remcom_in_buffer: The buffer of the packet we have read.
> + *	@remcom_out_buffer: The buffer of %BUFMAX bytes to write a packet into.
> + */
> +
> +extern void
> +kgdb_arch_handle_qxfer_pkt(char *remcom_in_buffer,
> +			   char *remcom_out_buffer);
> +
> +/**
>   *	kgdb_call_nmi_hook - Call kgdb_nmicallback() on the current CPU
>   *	@ignored: This parameter is only here to match the prototype.
>   *
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index 4b280fc7dd67..a0617c883029 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -792,6 +792,19 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>  		}
>  		break;
>  #endif
> +#ifdef CONFIG_HAVE_ARCH_KGDB_QXFER_PKT
> +	case 'S':
> +		if (!strncmp(remcom_in_buffer, "qSupported:", 11))
> +			strcpy(remcom_out_buffer, kgdb_arch_gdb_stub_feature);
> +		break;
> +	case 'X':
> +		if (!strncmp(remcom_in_buffer, "qXfer:", 6))
> +			kgdb_arch_handle_qxfer_pkt(remcom_in_buffer,
> +						   remcom_out_buffer);
> +		break;
> +#endif
> +	default:
> +		break;
>  	}
>  }
>  
> diff --git a/lib/Kconfig.kgdb b/lib/Kconfig.kgdb
> index 933680b59e2d..d7f70335efaf 100644
> --- a/lib/Kconfig.kgdb
> +++ b/lib/Kconfig.kgdb
> @@ -3,6 +3,11 @@
>  config HAVE_ARCH_KGDB
>  	bool
>  
> +# set if architecture has the its kgdb_arch_handle_qxfer_pkt
> +# function to enable gdb stub to address XML packet sent from GDB.
> +config HAVE_ARCH_KGDB_QXFER_PKT
> +	bool
> +
>  menuconfig KGDB
>  	bool "KGDB: kernel debugger"
>  	depends on HAVE_ARCH_KGDB
> -- 
> 2.7.4
> 

