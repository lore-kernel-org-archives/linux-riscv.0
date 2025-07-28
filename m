Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B53C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 17:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jP1VB0t1oz13cwwORlJlD7Fb9s/KpUt3ULPczXiAXB0=; b=dML6HJ7WYge7I8
	FTZhdelfSbwKqWOHPJoTsdUMrPH4w/Lz+eghR1SFUbMwwlX/WO8YggZnr3r4ivgR+E4rAo9mmvwLY
	P2J71QkbJ1vrG4WPKu6BCpalZvtHud/VSSFZMvnpJv1KhSlXp7suLZgk6jLgulZ4+tdNrdUB7dnZe
	ZuwSTHIAejtHsmTm7+LN1dp9uDURVSXPZdaOEkGkiX7m2r8j7VIrNq3sthIrceh/lhubPfE29ufUi
	J5nNrJs9NWQLDdvH83T/GICdfoAySVeMsbCg4CGZ5uu+eu7FTjOSfd1yPilAZJipNz1noebCv6XV6
	vtHEO/GLTYnbhyJcS/UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugRaV-0000000F61m-3Cob;
	Mon, 28 Jul 2025 17:24:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugR3T-0000000F20N-3KpQ
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 16:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753721426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=krd6Kt/L5G0L6bxrRwfmRWwoqSRe3HGaFQKVpx631I4=;
	b=fq5BMh4oRwRA73VmaNkFYuXBHj/QuSUBOqBdBhaH9gnDKPzprrExtY3VVQXJu/YO8hWuXL
	o9Oy89NHtdtH5Cv1+xvRhmfoVC+ix1JlTG0t+4xEURwQtRudTP99KTDjzWJBmv1GXHFGTa
	hiNLcjnH7CYkuwm7bicC4x54W8Vc5OE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-DeYs5rkCOGyeHxhP2AQWyw-1; Mon, 28 Jul 2025 12:50:24 -0400
X-MC-Unique: DeYs5rkCOGyeHxhP2AQWyw-1
X-Mimecast-MFC-AGG-ID: DeYs5rkCOGyeHxhP2AQWyw_1753721424
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so2625828f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 09:50:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753721423; x=1754326223;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krd6Kt/L5G0L6bxrRwfmRWwoqSRe3HGaFQKVpx631I4=;
        b=C5mh1sP/PxNTsGtYt4QZ4FxX5R27G1ru/BX9qE2uqXO3ukHknMSXnHYhODyh3Hu2SA
         lCIFcZW2ZYtiNOvtIjI5dbAs+i+9R4OGKOujYhPCSB3lBGIZkI602gjoKSUydQb1mvkZ
         aFZuaYpXyq1r4r4Rh7o8XtZuq5cpP1eGC4IJX7Q8Uf4vOE2udmsz0QzQrn6KjWoMnXZ/
         7x7dZap1zcSjIaSaU7KmxpFoqHP+CLCp4dSapXlGMHnCu0xFNp0L4z3aiJGxAQrmGsbi
         mlmClLyehHkuXgd329npvf4EPiDrQL5WcqVOb0VZGqQn2vxfupQPQ+pOYYjp/5SWA6Yv
         6dKA==
X-Forwarded-Encrypted: i=1; AJvYcCWpYFhPEASn82J7/z8vp3wv5mMGlzZy3+FrRU2+iZARIbtUP3rjwzzLgmXv+P4VE6wqChBB/oyVW3o92Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxzggZ2epF7Aq7BJUbM2GCZn0CDxj3o3v3J54Uh9KVwklwDkJoO
	vKBQdrBVYaeZJ3TVEfGLKi9PQGuSCL9h2tSrY/YDEU9gGsjZIqZaSM0ybfYI/pQFr9+xXkNX1gA
	sDHwz/lszzeEG0a0RBRUk5Y9WV2Cp3HhVidTtEh4GQejQVNUiUmF54aXuIn+i9uAz0JIlj6VlQZ
	wHts+M4ygORkM6TPpKX7mKdsgXpsjoYMt4ficMxrNgFRPt
X-Gm-Gg: ASbGnct8zJMq7vGFYh+2HFmRbyCqh4bVHlpdoDPa5ovkJZR9L4IRp+CZdGDGPaewjwn
	5VPSheZsPMIESujuRz+MLH1SZJBYtB+xcDmnID39R71g9xTRpA4ZTUNQIMoP8CpTJjde9zLSOS/
	MDSprXimoLZeQqsSOAivR7lA==
X-Received: by 2002:a05:6000:2289:b0:3b4:65d4:8e27 with SMTP id ffacd0b85a97d-3b77664284dmr8049084f8f.29.1753721423481;
        Mon, 28 Jul 2025 09:50:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9AiNoGh1fFHMtVXbzZwnzqr6JNT8EGrYNFrd7vLtXR4YXPbw8TBf9CBFH0MTT1XEnkoJVr47qarAG9eP/TTs=
X-Received: by 2002:a05:6000:2289:b0:3b4:65d4:8e27 with SMTP id
 ffacd0b85a97d-3b77664284dmr8049066f8f.29.1753721423075; Mon, 28 Jul 2025
 09:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
 <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com> <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
In-Reply-To: <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 28 Jul 2025 18:50:10 +0200
X-Gm-Features: Ac12FXzkdtm88_4dk2KzyvFSOMEmlVWQkf5aJBT83D16EQ1ktTyFz-doPwtE5M4
Message-ID: <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, 
	Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UDvILpc1aiOxlalE4J4i5yT9iM0F2iY2O4TunjO0Xz8_1753721424
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_095027_900322_F2EF329E 
X-CRM114-Status: UNSURE (   8.93  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Il lun 28 lug 2025, 18:21 Anup Patel <apatel@ventanamicro.com> ha scritto:
>
> Currently, userspace only has a way to enable/disable the entire
> SBI FWFT extension. We definitely need to extend ONE_REG
> interface to allow userspace save/restore SBI FWFT state. I am
> sure this will happen pretty soon (probably next merge window).
>
> At the moment, I am not sure whether userspace also needs a
> way to enable/disable individual features of SBI FWFT extension.
> What do you think ?

Yes, you do. FWFT extensions are equivalent to CPU extensions. But all
this should have been done before including Clement's work. Without it
userspace has no way to support FWFT.

Drew, I see you have Reviewed-by on the patches; please keep an eye on
this stuff.

Can you respin with the fix to the SoB line and no FWFT support?

Thanks,

Paolo

>
> Regards,
> Anup
>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
