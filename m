Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C03606A33E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 13:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Tz/V5olV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HmnvZQ5M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5YTw3xyxlVuI2ERx6Lr7dgDbxakBej9xx7p3NfBiVNs=; b=Tz/V5olVPd873ABEFaPmzTvSlI
	D1JHMP7yaHtIJ9pNTezSlsanQoBgDL0lJG/w9bjtPn4sfDUhL58lT/m2VqNE2fzhpy7RK5eZ5aVbf
	wmbB7RbqhztIijx/QsmZKvIe42dzkKZ+jNb86Omod+qqvSDVNZFB4xlrK5XZkgLaC9Fw5ZUMW/qS/
	BZcnxeryuMviasyvHSuGpxbQM1JjVsY0idGDUb5ZHMWd1Z8018Uqk81X/cr6m1GENP+HmIgMy5lUe
	N/7LoR5q96QRXHQ8z2pey4MI7yBnjuCTcDe8524CwOCQMOytLtUUo0B/eqOFp+Q0T+JXno8kBeOqP
	08eqmf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr6J-0000000Cr2R-2WBa;
	Fri, 13 Nov 2026 13:13:55 +0000
Received: from mail-dy1-x1334.google.com ([2607:f8b0:4864:20::1334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRr6E-0000000Cr0i-0j5Q
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 13:13:54 +0000
Received: by mail-dy1-x1334.google.com with SMTP id 5a478bee46e88-3704d30b84fso1233043eec.1
        for <linux-riscv@lists.infradead.org>; Fri, 13 Nov 2026 05:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794575629; x=1795180429; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fQV6O29CWbHJCWsUDVgERrsRMlGpm6PoDt5lhgxHvyo=;
        b=HmnvZQ5MU0k/kqJ9KkfIrEwyI6vvHuLefjKnlncfhIkKJS2iv2vQ/SUbaleO3p6oIZ
         +bmAHeO8sfhcDfKDN0YFCgqbVne4nkLrXzeBaeUs16xrcX9SnXb0+OcFKtC4jcQaeusb
         esl9LTFGIL8ANE3RyCJMbhMmDXMKSfezmFQR46xfOf3ETH3hTN51lldvgJQ4wJqoDWna
         8oo7WRP/s1OZfUVnZuJkto6YCtpNCLZ1UrM5yXQyFdwzD2Aq4lr37cqL9AnqWtkohKY3
         PPi1nlsLHNlHySjZbLlYL5IY1nnzKtFlcIpl4nLUOFoN6WG9QIWDDcATxsPDNTWqJjVD
         3AYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794575629; x=1795180429;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQV6O29CWbHJCWsUDVgERrsRMlGpm6PoDt5lhgxHvyo=;
        b=SAVQaX34zWNKFFsqQL7Bd1/NOoxsnAM3oWGy66jjNhggKToXU7KLOKcYM3NBv2sXH5
         AQm5FkJ6mO29yPHqy7MPFLccz/o7r8+JRH4spgW4nnOE/DuFuXlPxy2F7Pcv3vYvI+Bb
         X5QJ9aywPZUU8Ywtum4wlIG6wwDq2ffBNdz+9Dow/iKTJGBveWqv8Wa5EEqGhaNOy6v5
         fSmT2H0LuU35TTaXWa0sUzf0yj6+F94A3N2sqSvxPUTvoXQJWCRMTXqYS3I+pnv0U/O6
         HBDT+Pq+hfy+VXhxAwGzw6HAoeFlNLfgb9CjigZG9E9WibOclOwPMNMFzfJbmk6HSZkl
         6N/g==
X-Forwarded-Encrypted: i=1; AL+hErGtkuUiUR1hsrCm40v5QwojKWvV29fneHfaQxVQYK1Ix8k6zfcBdUsJy9vuLAJ8Q4jbLGk/GHXKZrcung==@lists.infradead.org
X-Gm-Message-State: APuU4Z8l7oD1eTl4rD2lJKlJBLlvgfnf5pZAuPDHb1npPmbx5NcBYShL
	UD5nX0ykyn0tzpIgHgNqZwn7eDmE7VyUCdNOJskLHbhf8niQaCVvirYS
X-Gm-Gg: AYBFou1K/dZIYoENQka/geqch59JNNit59Cfu6Jj0N6eX90njrC9Txttq+J228jbM2K
	js+ohLP66G+aw2MtlREbdXXvUrod1cmzsyLUa2ppCjSl8fF3uG6KMgudjp7MjhkkH1VQTQm/Ii/
	tpAkkBb7sc3QRLXdK6mSYEpIvaRNkkr9bFd8Ephbu1NrqHufg2n2BJa/ImHHHGRNYuZ326o12eA
	4ed7sFnf3ZBHmTs2Bc4AxqU0uLMj3V1RgyMEkEd8DQF7MvY1zEezY7iQvVGRr16EaFN3Y2r31Z5
	Hpg9/6D4omi+l9V0KgOQ43wMueUhXELfRw+SAsv8oDcFWDIWhIpFWYmjAW31eCW4dhnd9XfWeRQ
	88XEVgm8evFkEhPzzh4srPcOmpJ0K+vw9dkS2okq8TW/O6h40O0LLtwjsaD4crh29WsjS5Uysg3
	Ke2ewZ2ttgWiDOGF0OdpLWYg3cZmhHDwzufJ/9/VqvGEKZ1nuHsYVj4vsJvvZWBLRQrGDX9hKmh
	MjNewr7fkgrYp/O9aWOHJz48F0kv1BcnYJA03laKq81oNe+hmFCsdy3OXC1tK2mW8RtoPDM0ref
	aXUwq3Mi0+neuwIPzQ5p7ytSkqKsYQ==
X-Received: by 2002:a05:7300:de01:b0:369:daea:812a with SMTP id 5a478bee46e88-379682c2053mr1777573eec.30.1794575628817;
        Fri, 13 Nov 2026 05:13:48 -0800 (PST)
Received: from duge-G3-3500 ([183.192.220.187])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm7834718eec.29.2026.11.13.05.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 05:13:48 -0800 (PST)
Date: Fri, 13 Nov 2026 21:13:38 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Yao Zi <me@ziyao.cc>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <zya3wt4zziflg25y6grnvfcbfa6mnetn4o5c2khj2cii2wh7s6@ymjmxqyn37ks>
References: <20261106060525.346873-1-duge1256@gmail.com>
 <20261106060525.346873-3-duge1256@gmail.com>
 <au6niF5xiqj7cqJ4@pie>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <au6niF5xiqj7cqJ4@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_051350_217198_3CD07C9E 
X-CRM114-Status: GOOD (  33.11  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 07, 2026 at 04:22:32AM +0000, Yao Zi wrote:
> On Fri, Nov 06, 2026 at 02:05:24PM +0800, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Snapshot the shadow registers with aligned 32-bit reads and expose the
> > data in little-endian order at controller-relative offsets. Serve reads
> > from the snapshot and use keepouts for the remaining register ranges.
> > Keep the AES_WTM clock enabled and its shared reset deasserted while the
> > provider is registered.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  14 +++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 151 ++++++++++++++++++++++++++++++
> >  4 files changed, 167 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> ...
> 
> > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> > index d2f5bb236663..28d6c59fbd74 100644
> > --- a/drivers/nvmem/Kconfig
> > +++ b/drivers/nvmem/Kconfig
> > @@ -476,6 +476,20 @@ config NVMEM_SNVS_LPGPR
> >  	  This driver can also be built as a module. If so, the module
> >  	  will be called nvmem-snvs-lpgpr.
> >  
> > +config NVMEM_SPACEMIT_K3_EFUSE
> > +	tristate "SpacemiT K3 eFuse support"
> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > +	depends on OF && HAS_IOMEM
> > +	depends on COMMON_CLK && RESET_CONTROLLER
> > +	help
> > +	  Say Y here to read configuration and calibration data from the
> > +	  SpacemiT K3 eFuse shadow banks. The boot firmware must have loaded
> > +	  the shadow registers before Linux starts. Programming and reloading
> > +	  the fuses are not supported.
> 
> I didn't read K3's TRM, but is there a reason to depend on the
> bootloader to do so? We should depend on the state set up by bootloaders
> as less as possible, I think.

The Kconfig wording was incorrect: GEU loads the shadow registers in
hardware when it leaves reset. I will remove that requirement from the
help text. For the READY check requested by Troy, I will also trigger a
software reload in probe, since READY is only set after a software reload.


> > +	  This driver can also be built as a module. If so, the module will
> > +	  be called spacemit-k3-efuse.
> > +
> 
> ...
> 
> > diff --git a/drivers/nvmem/spacemit-k3-efuse.c b/drivers/nvmem/spacemit-k3-efuse.c
> > new file mode 100644
> > index 000000000000..d106053beae8
> > --- /dev/null
> > +++ b/drivers/nvmem/spacemit-k3-efuse.c
> 
> ...
> 
> > +static int k3_efuse_probe(struct platform_device *pdev)
> > +{
> 
> ...
> 
> > +	for (bank = 0; bank < ARRAY_SIZE(k3_efuse_bank_offsets); bank++) {
> > +		for (i = 0; i < K3_EFUSE_BANK_SIZE; i += sizeof(u32)) {
> > +			u32 val = readl(base + k3_efuse_bank_offsets[bank] + i);
> > +
> > +			put_unaligned_le32(val, efuse->data[bank] + i);
> 
> Does memcpy_fromio() works for the device? Otherwise, you could define
> efuse->data as an array of u32 instead of u8, so it keeps aligned and
> you could do a simple assignment here. Reading from efuse->data is
> always ok since memcpy() is used.

I will use your aligned-array alternative to preserve 32-bit MMIO reads.
The cache will be an __le32 array filled with cpu_to_le32(readl(...));
the read callback will keep using memcpy() with byte offsets.

Best regards,
Jiayu Du

> 
> > +		}
> > +	}
> 
> Regards,
> Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
