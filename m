Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 067EAC02188
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jan 2025 15:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfQeK7TSz4rk7+fBdwHLc1X9Ne+IaAp+UdENApEkEkM=; b=mBaFkdo4FwED3W
	QyMdlzETB7iaryAOLZXqCDue2zmAWhJoXJ/L4DARnm0tyM93daaWj2knUCNKLK6Sz5q0NvXbRbR8Q
	5HlcEIzhlL78BelRdT+pjHpTXu+h6cmitbOYVfuWa1IL+jz8kCy/AvGc+bXYrPTMLu3U5lEunsMuq
	ZMIcJMeYxHCP0HHbEadszVIVsVd2EzW8VeFdVwX/rDO13gpbHd4qdru+F6ciHOrJ6eoOOEl9XmYee
	IeXzZtNf26Gr4cOf3q5hKNefMorzVpByLleRsC+SA8tZncyZuAe4ZOFVyzdQCTHeANHrVBPL1fXaP
	h0Fblod0V3yJkeNFqSKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoey-00000000gMr-0ypG;
	Fri, 17 Jan 2025 15:53:24 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoev-00000000gLD-1bIQ
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jan 2025 15:53:22 +0000
Received: by mail-io1-xd2e.google.com with SMTP id ca18e2360f4ac-844e7409f8aso70807939f.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jan 2025 07:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1737129200; x=1737734000; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7E63vfoifeN0266UFl3CmBetwowaMxD5JK1imwgdXUU=;
        b=OhNLrQcLJ5k3QEPsjKgI295BnxgmUSJ7wY+f/HcfTW8C5ngKlJlcvcfV7zDHyYmaKP
         3vtn1ZgoAo8LQ+7BPnWQ3WI6GSxqhr8eFnBOtw2e93KriUp/xBtGZ60J5htc1Ip76oof
         VesneaFtAdh4RM3ewOoEhLDxLa4T0ijdy+4x4YWpt996bHGdW4M4TA6S8M8r8JjdBv0l
         7Jxjdr7R+ZdQfjRprIY/gRyrOeO5logtYV5nwCCR5z4McJjQx9F+JPNbd6J2cdReT3qj
         ECgoIY+iSz2fyIyqRKZMyIr0Jzi7RcELvMqBYM0lcWnFF4yJ+sBhK0D9nWJ8amP6JFuu
         3bUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129200; x=1737734000;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7E63vfoifeN0266UFl3CmBetwowaMxD5JK1imwgdXUU=;
        b=B3moCBjGRk+vmV3uxJzMU43qho0ZwTJogJ6VQokKL0E9Nvz9+r0YKe7nzJM2yt0Mox
         q/2DMv7V99RoCa3BL0aNIqs5WechDm8w4LcQ9KiXFo++gvOtxVW8tVXdSrQ755N4fWpE
         azZiJtZAGO/tH7XF8q7pyrjHksp3nSvcNk7NCnmQHH/J1jXc4ztj8tlYZMro+e6g7g70
         Mg6ZTXCt6l/cyB7g6isol+eaS/ZRPOKJmJggG4EzTFkEURzFgIp4OMHfNagxdgzo8FCy
         C14h8dw1SVGSkyQmfbJDaVT2jdR/YeagBn08LVcYocdZG/F/orc3yPG30GBM+uto1+u3
         ZgpQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpOg3zAh36tJr/FtypTNs//qSOBwAudEWoOt86aSYehPF1xQJnoBK4Sycw+qU9OL/IMQFbTUIRmeYSRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgeZFilA2GlJJxCp8BUg8kZ0bH6ejIMgaw+3tMk4f/eiSDQYsv
	wHC9/Z/wvoMnROJTzWNwYZTcGkev5S/f3F7L3FSJ2Af+rYLoZmV+O/GX/XfeFTzGoeDkYbrLrdP
	rPwCZa8ZCjmIBF3WFrjVgGkAHVh9kdi3rRZ0f2Q==
X-Gm-Gg: ASbGncv8oGm0r8w9pwhsYE2wWE6/xwwu+X23ntPU21LhvKTVotO2mfZApn64e3fJmPa
	KAaf1LydRyu/Z7QPBJFxkgnt3QL3Nuw3S69YsIDw=
X-Google-Smtp-Source: AGHT+IEBFN0smf2/xMRte+rDa7NGbWs/o9tvwRI5JcpREJT1MjNqqoS6tgTwYNGAuHJRpxn2V9yfVn+I7RHCKX143xQ=
X-Received: by 2002:a05:6e02:3783:b0:3ce:473d:9cba with SMTP id
 e9e14a558f8ab-3cf743c76e3mr22233015ab.5.1737129200267; Fri, 17 Jan 2025
 07:53:20 -0800 (PST)
MIME-Version: 1.0
References: <20250116120710.51673-1-luxu.kernel@bytedance.com>
 <Z4l1fklnUPyTSLO4@ghost> <87ldv9afso.ffs@tglx>
In-Reply-To: <87ldv9afso.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 17 Jan 2025 21:23:06 +0530
X-Gm-Features: AbW1kvZzN4IfK5cgNNHnHg3RTHxscMkyVKMwxU0HE34KLwsuPghy0qSAUSDRLIc
Message-ID: <CAAhSdy0cDUHASb0iOfGFdh_AW3NH-M+2JHTOG+O_FYkhAS4dDw@mail.gmail.com>
Subject: Re: [PATCH] irqchip: riscv: Order normal writes and IPI writes
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Charlie Jenkins <charlie@rivosinc.com>, Xu Lu <luxu.kernel@bytedance.com>, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, lihangjing@bytedance.com, 
	xieyongji@bytedance.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_075321_575329_D7BD44D1 
X-CRM114-Status: GOOD (  14.01  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgVGhvbWFzLAoKT24gRnJpLCBKYW4gMTcsIDIwMjUgYXQgNDowNeKAr1BNIFRob21hcyBHbGVp
eG5lciA8dGdseEBsaW51dHJvbml4LmRlPiB3cm90ZToKPgo+IENoYXJsaWUhCj4KPiBPbiBUaHUs
IEphbiAxNiAyMDI1IGF0IDEzOjA5LCBDaGFybGllIEplbmtpbnMgd3JvdGU6Cj4gPiBPbiBUaHUs
IEphbiAxNiwgMjAyNSBhdCAwODowNzoxMFBNICswODAwLCBYdSBMdSB3cm90ZToKPiA+PiBSZXBs
YWNlIHdyaXRlbF9yZWxheGVkKCkgd2l0aCB3cml0ZWwoKSB3aGVuIGlzc3VpbmcgSVBJIHRvIGVu
c3VyZSBhbGwKPiA+PiBwcmV2aW91cyB3cml0ZSBvcGVyYXRpb25zIG1hZGUgYnkgY3VycmVudCBD
UFUgYXJlIHZpc2libGUgdG8gb3RoZXIgQ1BVcy4KPiA+Cj4gPiBEaWQgeW91IGV4cGVyaWVuY2Ug
YW4gb3JkZXJpbmcgaXNzdWUgZnJvbSB0aGlzPwo+Cj4gVGhhdCdzIG5vdCB0aGUgcmlnaHQgcXVl
c3Rpb24uCj4KPiAgICAgICBDUFUgMCAgICAgICAgICAgICAgICAgICAgIENQVSAxCj4gICAgICAg
c3RvcmUgQSAgIC8vIGRhdGEKPiAgICAgICBzdG9yZSBCICAgLy8gSVBJCj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBJUEkgaGFuZGxlcgo+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgbG9hZCBBCj4KPiBUaGUgcmVhbCBxdWVzdGlvbiBpcyB3aGV0aGVyIHRoZSBSSVND
LVYgbWVtb3J5IG1vZGVsIGd1YXJhbnRlZXMgdW5kZXIKPiBhbGwgY2lyY3Vtc3RhbmNlcyB0aGF0
IEEgaXMgZ2xvYmFsbHkgdmlzaWJsZSBiZWZvcmUgdGhlIElQSSBoYW5kbGVyCj4gbG9hZC4gSWYg
c28sIHRoZW4gdGhlIHdyaXRlbF9yZWxheGVkKCkgaXMgZmluZS4gSWYgbm90LCB0aGUgZmVuY2Ug
aXMKPiByZXF1aXJlZC4KPgo+IFRoYXQncyBub3QgYSBxdWVzdGlvbiBvZiBvYnNlcnZhdGlvbi4g
SXQncyBhIHF1ZXN0aW9uIG9mIGZhY3RzIGRlZmluZWQKPiBieSB0aGUgYXJjaGl0ZWN0dXJlLiBQ
ZW9wbGUgaGF2ZSB3YXN0ZWQgbW9udGhzIHRvIGFuYWx5emUgc3VjaCBmYWlscwo+IHdoaWNoIHRl
bmQgdG8gaGFwcGVuIG9uY2UgZXZlcnkgYmx1ZSBtb29uIHdpdGggbm8gb3RoZXIgdHJhY2UgdGhh
bgo+ICJzb21ldGhpbmcgd2VudCB3cm9uZyIgLi4uLgoKVGhlIFJJU0MtViBGRU5DRSBpbnN0cnVj
dGlvbiBkaXN0aW5ndWlzaGVzIGJldHdlZW4gbm9ybWFsCm1lbW9yeSBvcGVyYXRpb25zIGFuZCBJ
L08gb3BlcmF0aW9ucyBpbiBpdHMgcHJlZGVjZXNzb3IgYW5kCnN1Y2Nlc3NvciBzZXRzIHdoZXJl
IHIgPSBub3JtYWwgcmVhZCwgdyA9IG5vcm1hbCB3cml0ZSwKaSA9IEkvTyByZWFkLCBhbmQgbyA9
IEkvTyB3cml0ZS4KClRoZSBpcGlfbXV4X3NlbmRfbWFzaygpIGRvZXMgc21wX21iX19hZnRlcl9h
dG9taWMoKSAoZXF1YWxzCnRvICJmZW5jZSBydyxydyIpIGJlZm9yZSBjYWxsaW5nIGltc2ljX2lw
aV9zZW5kKCkuIFRoaXMgcHJldmVudHMKb3JkZXJpbmcgb2Ygbm9ybWFsIG1lbW9yeSB3cml0ZXMg
aW4gaW1zaWNfaXBpX3NlbmQoKSBiZWZvcmUKc21wX21iX19hZnRlcl9hdG9taWMoKSBpbiBpcGlf
bXV4X3NlbmRfbWFzaygpIGJ1dCBpdCBkb2VzCm5vdCBwcmV2ZW50IEkvTyBtZW1vcnkgd3JpdGVz
IGluIGltc2ljX2lwaV9zZW5kKCkgdG8gYmUgb3JkZXJlZApiZWZvcmUgc21wX21iX19hZnRlcl9h
dG9taWMoKS4KClRoaXMgbWVhbnMgY3VycmVudGx5IG5vdGhpbmcgcHJldmVudHMgdGhlIEkvTyBt
ZW1vcnkgd3JpdGUgaW4KaW1zaWNfaXBpX3NlbmQoKSB0byBiZSBvcmRlcmVkIGJlZm9yZSBub3Jt
YWwgbWVtb3J5IHdyaXRlcyBpbgppcGlfbXV4X3NlbmRfbWFzaygpIGhlbmNlIHRoZXJlIGlzIGEg
dmVyeSB1bmxpa2VseSBwb3NzaWJpbGl0eQpvZiBhbiBJUEkgaGFuZGxlciBvbiB0aGUgdGFyZ2V0
IENQVSBzZWVpbmcgaW5jb3JyZWN0IGRhdGEuCgpUaGUgY29udmVyc2lvbiBvZiB3cml0ZWxfcmVs
YXhlZCgpIHRvIHdyaXRlbCgpIGluIGltc2ljX2lwaV9zZW5kKCkKYWRkcyBhICJmZW5jZSB3LG8i
IGJlZm9yZSB0aGUgYWN0dWFsIEkvTyBtZW1vcnkgd3JpdGUgd2hpY2gKZW5zdXJlcyB0aGF0IEkv
TyBtZW1vcnkgd3JpdGUgaXMgbm90IG9yZGVyZWQgYmVmb3JlIG5vcm1hbAptZW1vcnkgd3JpdGVz
LgoKQmFzZWQgb24gdGhlIGFib3ZlLCB0aGUgY29udmVyc2lvbiBvZiB3cml0ZWxfcmVsYXhlZCgp
IHRvCndyaXRlbCgpIGluIGltc2ljX2lwaV9zZW5kKCkgbG9va3MgZ29vZCB0byBtZS4KClJlZ2Fy
ZHMsCkFudXAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
