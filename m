Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 537FDC83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 11:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N9bCZknlJDCaXJ0If3q0ucWDKlkHnUuNs3QhRFhHQrg=; b=3Wj5lpxaK1R1Mz
	TMSsP4mh1qO7Y41uqxHDbSAR+uWVB+B4kJgN+sJctsYQDXDHJJxXfcT2I0PPYsOnYvnvXycTntJII
	AJ45oYyZHsMplgZJlz4djgsFqdsXxBbXxav3AWOLd93EkeWvHVyxat5g1zAPIwP646B3KmCtDSWNY
	SQSlgW72KaE4uF2ZdWuObpWKmfTrAHuHICS23/wfZteSS43mOIJQfgqBDq+xrFG5UhLyGYFj7d+5H
	AMpqSoHxextryg379QnhaCvsAdpQsyG/5W9uu7LKU3/vK2gARRkniz/rdzUd43oO4LHNGewhX7Tl+
	tNRohmVLS71RWLiFgT4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugidu-0000000GdTX-3Cmu;
	Tue, 29 Jul 2025 11:37:14 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugidq-0000000GdRK-3KBQ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 11:37:12 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4535fc0485dso5354705e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 04:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1753789029; x=1754393829; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNd74IQITEorMs9LyfvIzBFQmBs+koTjl7VxtOqVCCw=;
        b=WQ8e11mRV96zDMRty7L45k8NvdFq/gwr4++7VdJuBBjqhJPXbySCWRbWxfttaE1ljA
         ctFQNWkdsxbNTWlWrgP2BvUph0Mnr9tvEtFNm06snGQDQl2vJlfnYhGlJHylzUaKgPKD
         NwSXKuf+xHa+0BDcN4YF1rKdOa7VUnTlqdY5I4UYwywYR2S7WyFZcQpvAX+lLJ8D7B4W
         CBk0gi1TJQOSg894/CCNl2LfCjQsxCfr1KQB4MtPcEZGDibN8g8N0efqMKThLYz2CIZF
         0FgGBkeBYzrMsxzPj4Fvr++f55rhM2ti4H7He/KfgpCMKpwad+eBitBqb17TKwEDmKWr
         CG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753789029; x=1754393829;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mNd74IQITEorMs9LyfvIzBFQmBs+koTjl7VxtOqVCCw=;
        b=hpDD4wDtzI01NgcDY86LBSKXpsp7hPOONKIHkZSqlVJQ2K0aIAqGa7cJYwJNI6+uJL
         EfLplMJMQdfIZhvvA/o38eGkMv6pVULW+BoLvrou8b/pZoTjDdeUjNyH7IPjyqTv1Vfp
         qHUvTdgu9tC+mM94atm6Uirs5hbRCmXN/V95pz7joC36y1J8gtuwgiojQ/voICWaHDwB
         JbCgveI9QMNrnj5BD0+Bd//eMrKst0UPiOgFkGH66zzlDtNZB7NwxcWdf8g3ReCZ6Hrf
         JRCvKY2by/SGYVFuBBEv/sbkAfscUJjZRh3b2XbrGYxeMsl9KLvAJiNUK0+70znNkLPN
         +zEg==
X-Forwarded-Encrypted: i=1; AJvYcCXplDDmEoJ0Mb6eSkcFRJfiWQ0INzb8nFtE3bXzJYnYnxJMfKh/CbPQtxxQoLeNPrpQ0hJbjlQAN6E3YA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTdM4OapZv/oRD94l8ADQAhXzyThrU1bWIPGF3oIGzZ+z3qiDr
	7wbqLsWAfnCWozTGh+0ERYP3MAlki74J7Uoiji0XLFKdEF6QaCNn+YhDiUxq/wfqTFY=
X-Gm-Gg: ASbGncscX6F7xm1jppf/BN5m5+grGgHHLUK25Evr4YsB8Aqtzqj1BPG+dnM89bYACM+
	oK2K7gCgNAN0RNrKm07+uM9nXxJxhYy36NTX4ZGMIvsr06ld38Xkpvb25gEMNKGjC9zB/RGdaEP
	V3V8tvXuOkQR8h24VtVa829/dajB9uxsKTlIg3WoBniFD/OAn8lLjSN85cxukK1jaDQaR4Mexdc
	OuclYl6Bd35dyGslc6/bdIxNgfMd38puJWPTj2ja4M0OjIOXssh5uNIjfp3SPG3YkZ3bBGsOp3E
	rAk1H5YHvrml1+uALXMYHO4CxaiGqz+btuZfwfdygh2c+42nPNvoLRGjgZrvVSNNpp2ca7uTvTB
	U8R44LAFcbEtdDfhD5TurpH0d01TM98neK+oJ8TpU
X-Google-Smtp-Source: AGHT+IGx/xqumpoXOavJf3Q9WFPJjniNReIvUAgEgTBSvd6YC7kBN//pTA0UjL3asQ8LZFYOCaj+XA==
X-Received: by 2002:a05:600c:46ce:b0:43b:c844:a4ba with SMTP id 5b1f17b1804b1-4587654b656mr47415595e9.3.1753789028662;
        Tue, 29 Jul 2025 04:37:08 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200:293e:b70a:263b:689c])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4588e5cc2aasm22325705e9.16.2025.07.29.04.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 04:37:08 -0700 (PDT)
Mime-Version: 1.0
Date: Tue, 29 Jul 2025 13:37:07 +0200
Message-Id: <DBOIBORLK6YM.7SND5YPEJR60@ventanamicro.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
Cc: "Anup Patel" <anup@brainfault.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Andrew Jones" <ajones@ventanamicro.com>, "Atish
 Patra" <atishp@rivosinc.com>, "Atish Patra" <atish.patra@linux.dev>, "open
 list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, "KVM General" <kvm@vger.kernel.org>,
 "linux-riscv" <linux-riscv@lists.infradead.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>
To: "Paolo Bonzini" <pbonzini@redhat.com>, "Anup Patel"
 <apatel@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com> <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com> <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com> <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com> <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com> <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
In-Reply-To: <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_043710_821351_4A257419 
X-CRM114-Status: GOOD (  11.12  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

2025-07-28T18:50:10+02:00, Paolo Bonzini <pbonzini@redhat.com>:
> Il lun 28 lug 2025, 18:21 Anup Patel <apatel@ventanamicro.com> ha scritto:
>> Currently, userspace only has a way to enable/disable the entire
>> SBI FWFT extension. We definitely need to extend ONE_REG
>> interface to allow userspace save/restore SBI FWFT state. I am
>> sure this will happen pretty soon (probably next merge window).
>>
>> At the moment, I am not sure whether userspace also needs a
>> way to enable/disable individual features of SBI FWFT extension.
>> What do you think ?
>
> Yes, you do. FWFT extensions are equivalent to CPU extensions. But all
> this should have been done before including Clement's work. Without it
> userspace has no way to support FWFT.
>
> Drew, I see you have Reviewed-by on the patches; please keep an eye on
> this stuff.

Sorry, I didn't try too hard to convince others after noticing it, and
planned to fix the most significant breakage in later rcs.
(If FWFT wasn't enabled by default, sane userspace just wouldn't expose
 FWFT to the guest until a proper KVM configuration was added).

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
