Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0E45C43216
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 03:49:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8055A6103C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 03:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8055A6103C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6nR9aX/QVdFygrTD2IVeHOaN5/rV2NQhNSHli3tRxJ0=; b=tDXfwHfqZSKdtILyY5B3nGf47I
	Xq/r8ezQqmbGlij/JwUsilu9xeP1TctySvfSBQz9xH0UjJeeUEG3CM3U+1vaQUDpgc8jZbClhHTtg
	GCc2Hrduo+OM+j623bvPhP5xklytesLYTXN6MWhw5kuAh+MBjiUL2lCTj+154XgBYBSi08mfzHVyU
	j6riIWHczS5+uPncIlfibl2VUgDHzAyqw0tRLaz+q5LensR30edYZJeuAn6yAJrWNUAGXIAcezkDV
	zsvvIX8lvLuRruKLMnw8CpRYNW+oXC99u4hOnK8tYxL9t3vsRs1lO4szGNeVSdm6M4OLjnZSn7gDp
	ACSlkGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIjv5-005OXR-Df; Wed, 25 Aug 2021 03:49:43 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIjv1-005OUp-Qa
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 03:49:41 +0000
Received: by mail-pl1-x62f.google.com with SMTP id b9so9147040plx.2
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 20:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=CbvF3gcMl15CsJvEJlvAwV4jg0kS7/1c0/243X9NmVQ=;
 b=nS8Xfv5Np514ewOr71qM5OVYQ4om375+9iia5AAYDaK3OM+hzJenuJr7dAU5cYremk
 lMJSdk/H6gRuWyoAZ38Dxo4xTOwzwlYBTQ7mHvrJGvY2eRlpd9btrTwCc/T4R+lnp2Oz
 tfjjB9XYA84IA+sxs7E0+0bjR3ImZY/NCblTCqWV1vz8ngiUx+QRlaWbVMisVRWW3rOO
 yK85Pgi7JMY0nVAg9WrPZrM52PG/5lW+DmvVcQIgBTfNfdcKCdUHJCl4J+hHtwrGzLzq
 JQXK/nMftIjnNhxqPt/IHdPMmbV0SixoX/iiQ7rUV+IDNkS5Y0uflbsJwBJg2KghrkLe
 Gahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=CbvF3gcMl15CsJvEJlvAwV4jg0kS7/1c0/243X9NmVQ=;
 b=P7fjlq1ersHaGP1IfnqmyTM8+Wi6VkLTM1BptgPTMBIElXP77c8PGUzqaS/DJsndwQ
 53JhYxUPx3keXyxO75gD/J6+ytVuZ8mwhX3xq9VuPXFdCXpy7F3ZtXQo3h0DeKaPFPqf
 GHHdUmUYshbK8RdhZIu1rPrvtX1+31A0LmXoGFVHVg7dbvmR97KKDg+2Od1cIKcDny7P
 ftDSJtk0h4TcUMD8iK/l4JLk1h0L0yLvivJ7c7JNPnD9IFho3YlF/tm7joFQZGkxDEfH
 m1g8vkMV4Ul2TKqq6O03qG1LXTfvyRYZnhuesV35zn60PG8AnEHBUzTQLyF/xvimf1+p
 dw1A==
X-Gm-Message-State: AOAM530/Xiw1hAEP/HkC7HRGIjnRTFmIiG93pjNbiSW9l/Bi4BwtJ9KK
 +hBmGofV5VTjxtRYaEs3Uy2i7A==
X-Google-Smtp-Source: ABdhPJyuW0xG5fzwlVnm+V74njUWhK4iHoDYuJqptloS8iraqWcj5+LzzcKnLTPVDHS2p7IwfcePKA==
X-Received: by 2002:a17:90a:428f:: with SMTP id
 p15mr8241589pjg.75.1629863378109; 
 Tue, 24 Aug 2021 20:49:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q21sm23393107pgk.71.2021.08.24.20.49.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 20:49:37 -0700 (PDT)
Date: Tue, 24 Aug 2021 20:49:37 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 20:42:18 PDT (-0700)
Subject: Re: [PATCH 2/3] trace: refactor TRACE_IRQFLAGS_SUPPORT in Kconfig
In-Reply-To: <20210731052233.4703-2-masahiroy@kernel.org>
CC: rostedt@goodmis.org, mingo@redhat.com, masahiroy@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, ardb@kernel.org, bp@alien8.de,
 linus.walleij@linaro.org, 
 ley.foon.tan@intel.com, x86@kernel.org, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, 
 anshuman.khandual@arm.com, nickhu@andestech.com, tglx@linutronix.de,
 rppt@kernel.org, 
 geert@linux-m68k.org, peterz@infradead.org, catalin.marinas@arm.com,
 linux-riscv@lists.infradead.org, 
 yifeifz2@illinois.edu, green.hu@gmail.com, monstr@monstr.eu, deller@gmx.de,
 linux-sh@vger.kernel.org, 
 vgupta@synopsys.com, u.kleine-koenig@pengutronix.de, guoren@kernel.org,
 samitolvanen@google.com, 
 richard@nod.at, borntraeger@de.ibm.com, dalias@libc.org, aou@eecs.berkeley.edu,
 hca@linux.ibm.com, jdike@addtoit.com, jcmvbkbc@gmail.com,
 linux-hexagon@vger.kernel.org, 
 linux-xtensa@linux-xtensa.org, hpa@zytor.com, will@kernel.org,
 tsbogend@alpha.franken.de, 
 stefan.kristiansson@saunalahti.fi, linux-s390@vger.kernel.org,
 ysato@users.sourceforge.jp, 
 James.Bottomley@HansenPartnership.com, linux-um@lists.infradead.org,
 andreyknvl@gmail.com, frederic@kernel.org, 
 npiggin@gmail.com, benh@kernel.crashing.org, bcain@codeaurora.org,
 linux-csky@vger.kernel.org, 
 shorne@gmail.com, linux@armlinux.org.uk, linux-arm-kernel@lists.infradead.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, chris@zankel.net, gor@linux.ibm.com,
 linux-snps-arc@lists.infradead.org, 
 jonas@southpole.se, linux-parisc@vger.kernel.org, keescook@chromium.org,
 krzysztof.kozlowski@canonical.com, colin.king@canonical.com,
 davem@davemloft.net, linux-kernel@vger.kernel.org, 
 deanbo422@gmail.com, anton.ivanov@cambridgegreys.com, akpm@linux-foundation.org,
 mpe@ellerman.id.au, 
 paulus@samba.org, mark.rutland@arm.com, viresh.kumar@linaro.org,
 linuxppc-dev@lists.ozlabs.org, openrisc@lists.librecores.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: masahiroy@kernel.org
Message-ID: <mhng-fae2ea79-c261-4e5d-8eae-21e60810a957@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_204939_961404_7ECAB9B4 
X-CRM114-Status: UNSURE (   9.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, 30 Jul 2021 22:22:32 PDT (-0700), masahiroy@kernel.org wrote:
> Make architectures select TRACE_IRQFLAGS_SUPPORT instead of
> having many defines.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  arch/riscv/Kconfig            | 4 +---

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
