Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDAEE7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 15:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pqFRlsmSGZ8hI13PIroMGJzf4/juwbWQNmCt/eOqZck=; b=dFCCngY3t+LF3L
	7mMOoE507xLCqGaihTbWVyWbm1XBn5kMsqcRu51CWjRrndlIZ5zTHgONVIgvMPjSpHfZHHcVagdzN
	3XuXmtUVifL75W0APgPVmJPzvAu443u6hUQHtdzJ/gQAjWgIh04SgKnOKf3p1AYZ16SO7Zg3BMWPX
	0/opM3s3A+C+QqBLW8FRZyyZP0FEyoXEUybO2kPnsej0+lcu9UostKMBpGMd1B+LbG1RJo9Eyfe29
	XVO5LhzjhxT3Kl8+FmMyjCSb7nZJLayEPv/qeN+1HHP3XzcxX/h9XSHxIz3t0WQMslNha4P/OMzIM
	gNWejdsYRjQqNWatKNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOag-0000000FFpj-0vqv;
	Wed, 11 Dec 2024 15:25:30 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLOZ5-0000000FFVs-1pxb
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 15:23:52 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-728e81257bfso1494642b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 07:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733930630; x=1734535430; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sLkj4Ifhnd5YSMpubblk91DrbGMVpKZpsPDJsM64NlM=;
        b=iyaGFhIaU5EuKODDXx+Jb70aEd3Vraz6P92NzotKKQeSkd8CA5YboTMQdcNyqWQuGI
         McjC2lLMn4H9umNd6wdbsZ+dkfyNJfb40vlXOgTdBReESPN/lRYVqUHIbkRMI1T9SN04
         DQ43hH55G5qNVzog7KF8VU+Iw6+C/qBEY22MoD3Kt2WM2WZ1Wb8bPbymvnRmoHHYNLJY
         Jy4c4Nuv7G0ABzbcjkrJ4byDWJcK/LzURC+XUJN2ZSBqhPre14MMjvZnU0HML5n9r8KI
         O4wzx3tq7HTNiF3LORngAJyL+8L2bso3NpS36qBUlAgmAC+IrKLYJKRuT31CGqxXQBHp
         AowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733930630; x=1734535430;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sLkj4Ifhnd5YSMpubblk91DrbGMVpKZpsPDJsM64NlM=;
        b=fHwjY/dmmjv0HUoLWcKerg+M3Hv+2nOfApTs/RPDH3cC34KlnMt/aQ/BEkdi2tEtQ1
         y3XqByGmy7cpmhtu0uMA2oBJFPgIVDPKrJeaCWpfOvmtvnxBtqyMuTh2jBTK+1AR7glC
         z+r8BVe19UbvFqmKNQs9srQSQ+x0o02ruS6Ffi8K8ilpBJOnVRhjnY/A1dRbDZIkS9At
         ylpMSljcAd3Sqq21b5XAiza/kxJWAc4XJkdEpnWwSaUlvlhju3/HBVtVILjWRP056rFL
         ad6tsQvtyMDDTAbrImEIh1ktG9ouLhVmJF0CtDQd9V8tgfUqtXR6Pn1hQRFRTpiF2KhR
         Asyw==
X-Forwarded-Encrypted: i=1; AJvYcCX30NctC2axCYw8YfzIh/bjY96uBdoFRormDjtYefTTleAiWsfcZzZdRse/RKV9+GEQj+wa76OgtT7UJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZcU9+viV1d7e0wr4z4Cgf/K5sqR08x88DMavwXyTjGymdzGgs
	Ep4RtkAKv3j7wzqvrIBoGfwzYz/7CiO1pWmIE3zJEFpvVayVVNg2/klxXeJcL1fszpZyXgD0wcZ
	mTyPAA4ngN+Fp5gJgjdtSlBhHbeQ=
X-Gm-Gg: ASbGncvKewc4zn1UDf4kHvsXlmE48KJ8Sk/p495F+d9OD+EL0+Rdaf0QdaveTcf0dmD
	vKI0K+2zLC9eddhnj1paB+vl3fcydyDm9
X-Google-Smtp-Source: AGHT+IFc/NfHrj1+aZI2H+5hJnmAqxCLz+iF5mpm5G1Hn8PNWgHNai+NPG92bkP/jR0ykXpmJizMZqWewpx61btZW8M=
X-Received: by 2002:a17:90b:3c05:b0:2ee:f687:6ad5 with SMTP id
 98e67ed59e1d1-2f127f55592mr4838302a91.2.1733930630229; Wed, 11 Dec 2024
 07:23:50 -0800 (PST)
MIME-Version: 1.0
References: <20241210142353.6457-1-yongxuan.wang@sifive.com> <20241210142353.6457-2-yongxuan.wang@sifive.com>
In-Reply-To: <20241210142353.6457-2-yongxuan.wang@sifive.com>
From: Andy Chiu <andybnac@gmail.com>
Date: Wed, 11 Dec 2024 23:23:39 +0800
Message-ID: <CAFTtA3NVns7er2o+0Fu64uzy+83ScinRp=u5wcRd=MFCWnZraA@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: signal: fix signal frame size
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Zong Li <zong.li@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Ben Dooks <ben.dooks@codethink.co.uk>, Heiko Stuebner <heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_072351_474375_A5ADA434 
X-CRM114-Status: GOOD (  14.72  )
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

SGkgWW91bmctWHVhbiwKCllvbmctWHVhbiBXYW5nIDx5b25neHVhbi53YW5nQHNpZml2ZS5jb20+
IOaWvCAyMDI05bm0MTLmnIgxMOaXpSDpgLHkuowg5LiL5Y2IMTA6MjTlr6vpgZPvvJoKPgo+IFRo
ZSBzaWduYWwgY29udGV4dCBvZiBjZXJ0YWluIFJJU0MtViBleHRlbnNpb25zIHdpbGwgYmUgYXBw
ZW5kZWQgYWZ0ZXIKPiBzdHJ1Y3QgX19yaXNjdl9leHRyYV9leHRfaGVhZGVyLCB3aGljaCBhbHJl
YWR5IGluY2x1ZGVzIGFuIGVtcHR5IGNvbnRleHQKPiBoZWFkZXIuIFRoZXJlZm9yZSwgdGhlcmUg
aXMgbm8gbmVlZCB0byBwcmVzZXJ2ZSBhIHNlcGFyYXRlIGhkciBmb3IgdGhlCj4gRU5EIG9mIHNp
Z25hbCBjb250ZXh0Lgo+Cj4gRml4ZXM6IDhlZTBiNDE4OThmYSAoInJpc2N2OiBzaWduYWw6IEFk
ZCBzaWdjb250ZXh0IHNhdmUvcmVzdG9yZSBmb3IgdmVjdG9yIikKPiBTaWduZWQtb2ZmLWJ5OiBZ
b25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2FuZ0BzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBa
b25nIExpIDx6b25nLmxpQHNpZml2ZS5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL3Np
Z25hbC5jIHwgNiAtLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCj4KPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL3Jpc2N2L2tlcm5l
bC9zaWduYWwuYwo+IGluZGV4IGRjZDI4MjQxOTQ1Ni4uYzNjNTE3YjllZWU1IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3NpZ25hbC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwv
c2lnbmFsLmMKPiBAQCAtMjE1LDEyICsyMTUsNiBAQCBzdGF0aWMgc2l6ZV90IGdldF9ydF9mcmFt
ZV9zaXplKGJvb2wgY2FsX2FsbCkKPiAgICAgICAgICAgICAgICAgaWYgKGNhbF9hbGwgfHwgcmlz
Y3Zfdl92c3RhdGVfcXVlcnkodGFza19wdF9yZWdzKGN1cnJlbnQpKSkKPiAgICAgICAgICAgICAg
ICAgICAgICAgICB0b3RhbF9jb250ZXh0X3NpemUgKz0gcmlzY3Zfdl9zY19zaXplOwo+ICAgICAg
ICAgfQo+IC0gICAgICAgLyoKPiAtICAgICAgICAqIFByZXNlcnZlZCBhIF9fcmlzY3ZfY3R4X2hk
ciBmb3IgRU5EIHNpZ25hbCBjb250ZXh0IGhlYWRlciBpZiBhbgo+IC0gICAgICAgICogZXh0ZW5z
aW9uIHVzZXMgX19yaXNjdl9leHRyYV9leHRfaGVhZGVyCj4gLSAgICAgICAgKi8KPiAtICAgICAg
IGlmICh0b3RhbF9jb250ZXh0X3NpemUpCj4gLSAgICAgICAgICAgICAgIHRvdGFsX2NvbnRleHRf
c2l6ZSArPSBzaXplb2Yoc3RydWN0IF9fcmlzY3ZfY3R4X2hkcik7Cj4KPiAgICAgICAgIGZyYW1l
X3NpemUgKz0gdG90YWxfY29udGV4dF9zaXplOwo+Cj4gLS0KPiAyLjE3LjEKPgoKVGhhbmtzIGZv
ciB0aGUgZmluZGluZ3MKClJldmlld2VkLWJ5OiBBbmR5IENoaXUgPEFuZHlibkFDQGdtYWlsLmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
