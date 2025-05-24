Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D06C54ED1
	for <linux-riscv@archiver.kernel.org>; Sat, 24 May 2025 15:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ch824LNtPr8uKbzqNNQ0pqCImK75RusT/WWvhu6H39o=; b=YF0997Nxk55rIq
	l50O92nX/9wIjYZkNQ64KQcKhTuEn3HyN7j/DrnuT7KlBM4XQ9FUCGX/d2nLlkL2wMwhrtNLojs5e
	C8Vx5F5n5zFls3753xOkDysyytJOtzJnIvr97xetVL57DSGpd14ZgithH6TO2smlDxKiIbl6RtPYs
	3CIFm416cw9e9HTlmLGgY8dn1k9SK/cuMfvMDXhSy8h9DLNhkN6lhpeGEZ0rPhbd99ZA0A7PTPG7G
	Xd5YfQlMoGMKYc96Vm33BgTrX9vKQXjusKjBo6bOHBocQObRDOJIuqzNExZXfTqnEmqAUxxuRHtwU
	VR6qYZ+PLF6xU00LsPqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrH9-00000005yw9-1C2Y;
	Sat, 24 May 2025 15:59:07 +0000
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIrH7-00000005yvM-1HDt
	for linux-riscv@lists.infradead.org;
	Sat, 24 May 2025 15:59:06 +0000
Received: by mail-il1-x133.google.com with SMTP id e9e14a558f8ab-3dc75fe4e9bso6166265ab.0
        for <linux-riscv@lists.infradead.org>; Sat, 24 May 2025 08:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1748102344; x=1748707144; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2yr9tnKn9TqlbBE9wxEbTUU2i1OSmwquvIPpcnGXAE=;
        b=x4GVBl7kPlAJqohyOKbiMl8ZolBBS9Qde6qg8ZcnkMypu1TLakIMuZu4YGdL9Mqkh8
         j4Bdtt3i8aEx0UjMB56Xp7anyzepOPQfLyA0I7YR7x103cD929dT3A5dguitu+kvKoVn
         6X9YHFh+TmEFL6weQmiPvfZAZL0eydRExpTB0FyyHRca0rPCXm92PceZMd5vJtm2Xe3q
         /Nt+06IHsZZye73M4tPxVtOM8j02LM6iPRRxHaTvNZHPZ/zZollbzGuttiwmXFbgJIxe
         daY7v+xoWD/zpI2vUFWRk2dF9oHTGmZOuimdo8NyT/yFyDSatS+IqJAHzt+P+YI1pYPp
         b9RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748102344; x=1748707144;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F2yr9tnKn9TqlbBE9wxEbTUU2i1OSmwquvIPpcnGXAE=;
        b=IvKMuixIt4WH/5sBEuJoRCEHdmjkHXAkaBaqRxVTN1gMg/xsbUaxUu5ZHmuHcxW2X5
         VOSf2Hw1+RUIHXyEKSbFO0YisLK3CEoop9Wv7Qk2eGPA/ILFSM/SycpCh8uqqd3xtrDc
         DtunEty9C5mzy1Ssewa9IV2rQwthvlrivtpRu7smPk+BecudmCEYke6KZCo8pU3M+Fk8
         KHUsu5NaGh2CKyJPXxpt9yfyXIVSi65C33xh7sgir/s2bZ3vrZOh1jr0fMf1Tx8kZN5p
         pF+HTUZsu7pC+uK2T2JMPy6lZaGs5SlmogDOQLEo6RdmbzI6P6MmYWM96xHGZe+V+f6V
         RwZA==
X-Forwarded-Encrypted: i=1; AJvYcCW6pw6mWxbJzv0Y6k/qIFq0+yKvKBVEBAOSQ7hhkk9xSJzXGVOHSCz4hNhuJ8k8U8nQFPiRszHY/B3vxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyH4UBJBFSSoN0SGGPFDmgqXCH7Ulv4WbtP0sEJI9TWsqmmQ59s
	mRnGtqwEY7TMyxLtnjXDWdOk+M6yN+FGKS8Fkc6yFyYkS72k0qrlsCiApGMrb4V2REU+vUtrR0q
	0Dm7bYQamAPfa0LiVyZdpiEKQwU7vBvexzqxE9P7FmQ==
X-Gm-Gg: ASbGncuyx+iiRKQUDmddy1D4K4rkp6+EzyIeCW4qk15QFjQTkSZ5kxCGOsnPkf8QNuH
	7WlOHsdeXJdw1n0WKtl9kwu09lVGeF1zMusIkN9QcmIqrn7MgvkIfczv2Ioq+W2Bv2HFkJYgq+V
	QNkHnoM2oTm6idqXhAq2TDt4j3hHZD9EaQ
X-Google-Smtp-Source: AGHT+IEV4eb+rq7jqSPU1O3ArOm2/AotMQitLIc1b82BqLuQmpgD0sL2W5ul1eYPBn+JqoU3IEelxgq8AvLf22NB40g=
X-Received: by 2002:a05:6e02:3993:b0:3dc:8e8b:42af with SMTP id
 e9e14a558f8ab-3dc9ae6add9mr28247415ab.7.1748102343954; Sat, 24 May 2025
 08:59:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
In-Reply-To: <20250523104725.2894546-4-rkrcmar@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 24 May 2025 21:28:51 +0530
X-Gm-Features: AX0GCFtOMEl61Vu092B4vlrmT3A99i4MJFIakv747HMx06wfCiv1EtyVxeD1GV0
Message-ID: <CAAhSdy0M8ozHyR1mfW1u4-w=4xZm404jR4iqLRL0FtDh7RRvAg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: lock the correct mp_state during reset
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yong-Xuan Wang <yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250524_085905_541481_B760EA0A 
X-CRM114-Status: GOOD (  12.65  )
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

T24gRnJpLCBNYXkgMjMsIDIwMjUgYXQgNDoyMuKAr1BNIFJhZGltIEtyxI1tw6HFmSA8cmtyY21h
ckB2ZW50YW5hbWljcm8uY29tPiB3cm90ZToKPgo+IFdlJ3JlIHdyaXRpbmcgdG8gKnRtcCwgYnV0
IGxvY2tpbmcgKnZjcHUuCj4KPiBGaXhlczogMjEyMWNhZGVjNDVhICgiUklTQ1Y6IEtWTTogSW50
cm9kdWNlIG1wX3N0YXRlX2xvY2sgdG8gYXZvaWQgbG9jayBpbnZlcnNpb24iKQo+IFNpZ25lZC1v
ZmYtYnk6IFJhZGltIEtyxI1tw6HFmSA8cmtyY21hckB2ZW50YW5hbWljcm8uY29tPgoKTEdUTS4K
ClJldmlld2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKSW1wcm92ZWQg
Y29tbWl0IGRlc2NyaXB0aW9uIGF0IHRoZSB0aW1lIG9mIHF1ZXVpbmcuCgpRdWV1ZWQgdGhpcyBw
YXRjaCBmb3IgTGludXgtNi4xNgoKVGhhbmtzLApBbnVwCgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2t2
bS92Y3B1X3NiaS5jIHwgNCArKy0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmku
YyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBpbmRleCAzMWZkM2NjOThkNjYuLjZlMDli
NTE4YTVkMSAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+IEBAIC0xNDMsOSArMTQzLDkgQEAgdm9pZCBrdm1f
cmlzY3ZfdmNwdV9zYmlfc3lzdGVtX3Jlc2V0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwKPiAgICAg
ICAgIHN0cnVjdCBrdm1fdmNwdSAqdG1wOwo+Cj4gICAgICAgICBrdm1fZm9yX2VhY2hfdmNwdShp
LCB0bXAsIHZjcHUtPmt2bSkgewo+IC0gICAgICAgICAgICAgICBzcGluX2xvY2soJnZjcHUtPmFy
Y2gubXBfc3RhdGVfbG9jayk7Cj4gKyAgICAgICAgICAgICAgIHNwaW5fbG9jaygmdG1wLT5hcmNo
Lm1wX3N0YXRlX2xvY2spOwo+ICAgICAgICAgICAgICAgICBXUklURV9PTkNFKHRtcC0+YXJjaC5t
cF9zdGF0ZS5tcF9zdGF0ZSwgS1ZNX01QX1NUQVRFX1NUT1BQRUQpOwo+IC0gICAgICAgICAgICAg
ICBzcGluX3VubG9jaygmdmNwdS0+YXJjaC5tcF9zdGF0ZV9sb2NrKTsKPiArICAgICAgICAgICAg
ICAgc3Bpbl91bmxvY2soJnRtcC0+YXJjaC5tcF9zdGF0ZV9sb2NrKTsKPiAgICAgICAgIH0KPiAg
ICAgICAgIGt2bV9tYWtlX2FsbF9jcHVzX3JlcXVlc3QodmNwdS0+a3ZtLCBLVk1fUkVRX1NMRUVQ
KTsKPgo+IC0tCj4gMi40OS4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
