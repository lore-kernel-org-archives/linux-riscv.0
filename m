Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E14FC4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Nov 2023 16:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HNWXeB3YhvJ+TBdhgCjPcrVmmKMP3Zl/v24BgT0t9wI=; b=CAF2XoPTJiJt2n
	cpY/9fkDDRE9SZ72rIqZgI5rb1a6Ap3oXQpGvhrsho0eL+vX3zd7rw4RfJIuXhvpWGNFUd5EeQwiR
	uj3mqr2nf0Wr+6XuFUyHF2aRhlqyV4lsekYy419wBmM3E6ZCjxFvVwwpp6ihKbxTCSTWOwQ0PV/Yh
	hh3Kx30rf/4WTJOaLnI3WD+3L9U+/AI28ueRXrMdn4U1Z+R6c2A53dozKT/VtauBPzjAAt3aFkPTO
	tk4sNvl7wdsBb+SLXTFsqEcLvVLRSrsOU3C1DO39c2U7GqT4m+A1N/A2+g5DT7UJVYtaZqgCiMlaZ
	WXA9o1/dnFsHQW8p4W0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r02QK-00H6OU-1a;
	Mon, 06 Nov 2023 16:26:00 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r02QH-00H6NV-38
	for linux-riscv@lists.infradead.org;
	Mon, 06 Nov 2023 16:25:59 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2c509f2c46cso65518651fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Nov 2023 08:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699287954; x=1699892754; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A1RPGGvD76skwr1fIMgrbOKMlbdShvjRavpQzlk+GXI=;
        b=pTP22fmqJBOTltVbfznvRlakD5FYoOfmsQRoNZDh2qphTldaSmfIVRG8PeBatdd00g
         oZb0mXi9GH+fZbTgdeoYuifalnggg6y6hPZvsQJz22aI2gSh0MaUH/eWLAKJgW/PZkoM
         l5TqI64a61j5mTWleMTDWWqXbzGFMrtIDcwauS4mQNI0BTcntWiM8N2XcvLkpbNICcgV
         wM8z23rnnMm0Kwf3q6xm6iLnboXRYHQZJBMGmKSLf8g++fvVBUiPHn+8oxnWde2M6oHv
         GZ0mK05AQRuIMZZLEwd+qFvGbnXQQ/p9ml16fao79+zWnP9/Pj/RLj1ocoUH4FWoNH+D
         Qw4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699287954; x=1699892754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A1RPGGvD76skwr1fIMgrbOKMlbdShvjRavpQzlk+GXI=;
        b=fyfj2PgmmCRspFagyuUIllAf42kEIsOuroM+cYyaxCCdTSHlohjzTT1n00LFn5is/x
         +qzc373i+WDbvlZAoK2+ut63ZG+XnuPZbj7OW3BG9YbBylskLPztLJSXifSfh6YLZYXD
         0r8hoFuBMML5GEHLSL8xQlBWi8pET8xINEyXalvoGS+/TR9/cDvpRF7ReHj/seAT+67L
         ce/B6UEk7XEBlNKmT9rkTBam446dsM/ALEkmVTQQumMvcpeTuq2fwOG/gMm06W1xjAGU
         VYyC1VTQ4TU3H+2VymZ5I1MvTdg0hxEEHg4eUnKo+2RaD/56RFdfZS1D2RBqZPKdq3Mh
         rNeQ==
X-Gm-Message-State: AOJu0YyDxYDo54WxaekP13GaWz262UuX1Y9yFYxAivMInSt1mBAnzgJU
	rjY19yyfR3PeAET5c9OrnRGqobXMSa710eCUwwAOqg==
X-Google-Smtp-Source: AGHT+IE3kyFqDDM+Wa5oluvmBv+ILPRhtbSABRO6TwrbySF2gNOOBYu4MJVPtKTZgGXBslfocVGdVep6djXvFOZ8naQ=
X-Received: by 2002:a2e:aaa3:0:b0:2c5:14da:91f2 with SMTP id
 bj35-20020a2eaaa3000000b002c514da91f2mr22136625ljb.22.1699287954168; Mon, 06
 Nov 2023 08:25:54 -0800 (PST)
MIME-Version: 1.0
References: <ZUEiCUxcd11inlRP@xhacker> <20231031164411.9YRGasL-@linutronix.de>
 <ZUI5h6eIhTlPAmGh@xhacker> <20231102-spearman-overcrowd-a86bfb958609@wendy>
 <20231102155423.SyuAibSe@linutronix.de> <20231103-army-gloater-af710df04628@spud>
 <20231103082411.f_ZU1E7V@linutronix.de> <CALs-HstDSr6arKw+b-HWbEQAgQCNbicJv4H-UKAooa8VxcpnMw@mail.gmail.com>
 <20231103173936.OHevJ107@linutronix.de> <CALs-Hsun_6SfdWXHPx-D4djhrKTfwCSm4rkMpt68i+djyDb+RQ@mail.gmail.com>
 <20231106085333.AkU2s0m-@linutronix.de>
In-Reply-To: <20231106085333.AkU2s0m-@linutronix.de>
From: Evan Green <evan@rivosinc.com>
Date: Mon, 6 Nov 2023 08:25:17 -0800
Message-ID: <CALs-HsuEfaT60_27yZO8xjzXCkD77dVjgwF4jh9=uPD6hxAZzw@mail.gmail.com>
Subject: Re: [PATCH RT v2 0/3] riscv: add PREEMPT_RT support
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	tobias.schaffner@siemens.com, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_082558_203940_5D820A8A 
X-CRM114-Status: GOOD (  38.19  )
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

T24gTW9uLCBOb3YgNiwgMjAyMyBhdCAxMjo1M+KAr0FNIFNlYmFzdGlhbiBBbmRyemVqIFNpZXdp
b3IKPGJpZ2Vhc3lAbGludXRyb25peC5kZT4gd3JvdGU6Cj4KPiBPbiAyMDIzLTExLTAzIDExOjIy
OjQwIFstMDcwMF0sIEV2YW4gR3JlZW4gd3JvdGU6Cj4gPiA+IEkgZG9uJ3Qga25vdyB3aGF0IGl0
IGRvZXMgYW5kIGhvdyBvZnRlbiBpdCBuZWVkcyB0byBiZSBkb25lLiBUaGUKPiA+ID4gcXVlc3Rp
b24gaXMgd291bGQgaXQgYmUgb2theSB0byBkbyBvbmNlIG9uIHN5c3RlbSBib290IG9yIGRvZXMg
aXQgbmVlZAo+ID4gPiB0byBiZSBkb25lIGVhY2ggdGltZSB0aGUgQ1BVIGdvZXMgdXA/IElzIGl0
IHJlcXVpcmVkIHRvIGJlIHRoZSBmaXJzdAo+ID4gPiB0aGluZyBpdCBkb2VzIG9yIGNhbiBpdCBi
ZSBkZWxheWVkIHRvIHNsaWdodGx5IGxhdGVyIHBvaW50IGluIHRpbWU/Cj4gPgo+ID4gSXQncyBl
c3NlbnRpYWxseSBhIGNoYXJhY3Rlcml6YXRpb24gd2UgZG8gb24gZWFjaCBDUFUgdG8gZmlndXJl
IG91dCBpZgo+ID4gbWlzYWxpZ25lZCB3b3JkIGFjY2Vzc2VzIGFyZSBmYXN0IG9yIHNsb3cuIFRo
aXMgaW5mbyBpcyByZXBvcnRlZCB0bwo+ID4gdXNlcm1vZGUsIGFuZCBwb3RlbnRpYWxseSBoYXMg
a2VybmVsIGNvbnN1bWVycyBhcyB3ZWxsIChDaGFybGllJ3MgaXAKPiA+IGNoZWNrc3VtbWluZyBz
ZXJpZXMgd2FudHMgdG8gZmxpcCBhIHN0YXRpYyBicmFuY2ggYmFzZWQgb24gaXQpLgo+Cj4gU28g
eW91IG5lZWQgdG8gZG8gdGhpcyBvbiBlYWNoIENQVT8gQW5kIHRoZXJlIG1heSBiZSBkaWZmZXJl
bmNlcyBiZXR3ZWVuCj4gQ1BVMCBhbmQgQ1BVMT8gT24geDg2IGZvciBpbnN0YW5jZSBhbGwgQ1BV
cyB3aXRoaW4gb25lIHNvY2tldCBiZWhhdmUgdGhlCj4gc2FtZS4gSSdtIG5vdCBhd2FyZSB0aGF0
IGRpZmZlcmVudCBDUFVzIG9uIHNvY2tldHMgd2l0aGluIGEgc3lzdGVtIGFyZQo+IHN1cHBvcnRl
ZC4KPgo+ID4gSW4gYSBzZW5zZSBJIGJhcmVseSBuZWVkIHRoZSBidWZmZXIsIHRoZSBidWZmZXIg
aXMganVzdCBhIHJ1bndheSBJIHVzZQo+ID4gdG8gZG8gZHVtbXkgbWVtY3B5cyBhY3Jvc3MuIEkg
bmVlZCB0byBkbyBpdCBvbmNlIG9uIGJvb3QgZm9yIGVhY2ggQ1BVLAo+ID4gYW5kIGZvciBhbnkg
YWRkaXRpb25hbCBDUFVzIHRoYXQgc2hvdyB1cCB2aWEgaG90cGx1Zy4gSXQgZG9lcyBub3QgbmVl
ZAo+ID4gdG8gYmUgZG9uZSBhY3Jvc3Mgc3VzcGVuZC9yZXN1bWUuCj4gPgo+ID4gVGhlIHBhdGNo
IGluIHF1ZXN0aW9uIHdhcyBhbiBhdHRlbXB0IHRvIG1vdmUgdGhpcyB3b3JrIHRvIGJlIGRvbmUg
aW4KPiA+IHBhcmFsbGVsLCBzaW5jZSBvbiBzeXN0ZW1zIHdpdGggbG90cyBvZiBDUFVzLCBkb2lu
ZyBpdCBzZXJpYWxseSBpbgo+ID4gc21wX2NhbGxpbigpIHdhcyBjYXVzaW5nIGJvb3QgdGltZSBy
ZWdyZXNzaW9ucy4KPiA+Cj4gPiBGb3IgYm9vdCwgSSB0aGluayB0aGUgcGxhbiBJIG91dGxpbmVk
IHNob3VsZCB3b3JrOiBhbGxvY2F0ZSBhbGwgcGFnZXMKPiA+IGluIHRoZSBpbml0Y2FsbCBiZWZv
cmUgY2FsbGluZyBvbl9lYWNoX2NwdSgpLiBGb3IgaG90cGx1ZywgSSdsbCBoYXZlCj4gPiB0byBm
aW5kIGEgc3BvdCB0byBhbGxvY2F0ZSBhIGJ1ZmZlciBiZWZvcmUgdGhlIENQVSBjb21lcyB1cCwg
c28gaXQgY2FuCj4gPiB1c2UgaXQgaW4gc21wX2NhbGxpbigpLgo+Cj4gTXkgcXVlc3Rpb24gc3Rp
bGwgcmVtYWluczogSXMgdGhpcyBuZWVkZWQgdG8gYmUgZG9uZSBvbiBlYWNoIENQVSBpbiB0aGUK
PiBzeXN0ZW0gb3Igd291bGQgb25lIENQVSwgdGhlIGJvb3QgQ1BVLCBiZSBzdWZmaWNpZW50PyBU
aGUgc3RhdGljIGJyYW5jaAo+IHlvdSBtZW50aW9uZWQgaXMgbm90IHBlci1DUFUgYmFzaXMgdGhp
cyBpcyBwZXIgc3lzdGVtLiBJZiB5b3UgaG9vawo+IHRoaXMgY2hlY2sgdG8gQ1BVLWhvdHBsdWcs
IHRoZW4gdGhpcyB3aWxsIGhhcHBlbiBmb3IgaW5zdGFuY2UgZHVyaW5nCj4gc3VzcGVuZC8gcmVz
dW1lIChvZiBpZiB0cmlnZ2VyZWQgbWFudWFsbHkpIGFuZCB0aGUgQ1BVICJmZWF0dXJlIiB3aWxs
Cj4gbGlrZWx5IG5vdCBjaGFuZ2UuCj4KPiBBcyBuYWl2ZSBhcyBJIGFtLCBJIHdvdWxkIGFzc3Vt
ZSB0aGF0IGRvaW5nIHRoaXMgb24gdGhlIGJvb3QgQ1BVIHNob3VsZAo+IGJlIGVub3VnaC4KCkkg
ZG9uJ3QgdGhpbmsgaXQncyBzYWZlIHRvIGFzc3VtZSBhbGwgY29yZXMgd2lsbCBiZSB0aGUgc2Ft
ZS4gV2l0aCB0aGUKcHJvbGlmZXJhdGlvbiBvZiBiaWcuTElUVExFLWVzcXVlIGRlc2lnbnMgKGV2
ZW4gSSB0aG91Z2h0IG9uIEludGVsKSwKYW5kIHRoZSBsaWtlbGlob29kIG9mIGV2ZW4gZ3JlYXRl
ciB2YXJpZXR5IG9uIGFuIGFyY2hpdGVjdHVyZSBsaWtlCnJpc2MtdiwgSSB0aGluayBpdCBtYWtl
cyBzZW5zZSB0byBkbyB0aGUgbWVhc3VyZW1lbnQgb24gZWFjaCBjb3JlLiBZb3UKYXJlIGNvcnJl
Y3QgdGhhdCBpbiB0aGUgaXAgY2hlY2tzdW0gc3RhdGljIGJyYW5jaCwgd2UgY2FuIG9ubHkgdGFr
ZQp0aGUgcGF0aCBvcHRpbWl6ZWQgZm9yIG1pc2FsaWduZWQgbG9hZHMgaWYgYWxsIGNvcmVzIHN1
cHBvcnQgaXQuCgpUaGUgZ29hbCBpcyB0byBtZWFzdXJlIGFsbCBDUFVzIGluIHBhcmFsbGVsIGF0
IGJvb3QsIGFuZCB0aGVuIG1lYXN1cmUKYW55IG5ldyBob3RwbHVnZ2VkIENQVXMgYXMgdGhleSBh
cnJpdmUuIFlvdSdyZSByaWdodCB0aGF0IGFjcm9zcwpzdXNwZW5kL3Jlc3VtZSBvciBvdGhlciB0
aW1lcyB3aGVuIHdlIGRvbid0IGV4cGVjdCB0aGUgQ1BVIHRvIGNoYW5nZQpvdXQgZnJvbSB1bmRl
ciB1cywgd2Ugc2hvdWxkIGF2b2lkIHJlLW1lYXN1cmluZy4gTXkgcGFyYWxsZWwgcGF0Y2gKYWlt
cyBmb3IgdGhhdCwgdGhvdWdoIHRoZXJlIGNvdWxkIHN0aWxsIGJlIGlzc3Vlcy4KLUV2YW4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
