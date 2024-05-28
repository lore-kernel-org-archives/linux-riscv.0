Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABE9C25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 05:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/jp3ESt/uTpHJnWjNzPH3ARgMPAV6giFBH0NPx+niFM=; b=39LtJ1J3NuQ9eK
	KfF4A7MpuGQApicS2BOv0giWHa5GJhDRnAXncVsCzIFOjnXSvIksPO4Q6N9tmo0gHArvE0L4TVZl0
	CEajaupXEf/vHOj7NgPAnnTuIJMMWZcbVLMXRkyIVrM/PSX+RQ5/BlBSOrWj1MdoFkZpQgJyu+vIU
	hJr1vI5juGwUG8CIZL2FAbzx9w4zGkL5FHRtBjrnbJpD6K3VuebVHksujtGAioXVsPe7POFpXVBJp
	2pEuN5OiKCuuSA6B3zFyia1HH592OsqU7KuUc/M9HKC9E/s4R42OLXuMB5SDpOaUranUotTJpLjjE
	bfPNKanmLy6PXiIjrafg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBp8n-0000000H54C-47L8;
	Tue, 28 May 2024 05:12:53 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBp8j-0000000H53k-3E6i
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 05:12:51 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-a63359aaacaso39672566b.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 May 2024 22:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1716873164; x=1717477964; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEzBOXaIzbfMi17IPevGDHsDdowwd5GTFXbnEzHCSrk=;
        b=VCcn5sZZ3VMiQ++WmCfJXWkgPPTO4yC4I9Tphd+xq5TDnHoqLEr16Eivig3wb2ipNy
         tPRh6iVQPdLAhRrxVjruf3q7fiCj3h4xlTSENLsVAL6d1qfgqKbNkctBuZ2whyqlUYXs
         QsLWdnxPCNRQbBx+SprARuJcvaxqcs+kPfOjD8dkBikNmUyIoak1Za+EV/iNEtRv69WK
         uCM2O8wzQmIN/RKo2nwHYi7lWDKDXfjMblEzukYdX//BB25Dtbub4jNdDMsfbm+p5HGM
         YeXeGM7eyThU7oifHZlnyNYaPjwSpKln9IY/sofeBHZPZgMjW/N/LNDTQ5YX/Eb7W7Xa
         n6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716873164; x=1717477964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEzBOXaIzbfMi17IPevGDHsDdowwd5GTFXbnEzHCSrk=;
        b=b9TfdiAi9xnxqR03U2MqZ2wm6tCntvdJvaZPK8UqJ/6eVxNq9RTsB2sA24+yu3cJl+
         rPkZKlKp4fUQP+WVwwNOCT60PfnjtOhAWqptbTh4vPPGFQNsBWG+bDvaXM0yCBjYhO3Z
         OVEcR4CeCTmQx6gG6TddSFlLlE8JZO1ym/ppeZdAPcXyMUrprWmBuE8+iq6W5Ow55iJK
         sMsvPpbw2+vtiyZ6PuQTbYkqlyRRAdQJeWLwqNfX2Ffbi6VeJKGfjvLvFCo5K6rAdieJ
         vNILWFXkkg0aiaubjgDCd/E0gydDNytGbpPMWcbde6syKTW7TUCF7YtqkL58T68yKnRe
         AATg==
X-Forwarded-Encrypted: i=1; AJvYcCVfCqM5l/uuIqhzj0eT/fSNQ4Bouv+lH6poSZLIY8RDPWSA8Eaw2uQqITx4grLObJK1h34kUQsqRHrwTimAJrfNx973n9S/b74zvPCk0vUm
X-Gm-Message-State: AOJu0Yz9/O9HJ3yvUm8I+99umnq2SpnT/Gc5uSboX65kEvEpMgJf/igA
	akFdeH4j6amFoFHgsh2iCCTWOuhhNtDRTNy9l8b1TWwu2OmjWh4RPr0mB4jVN77imHDtjwdv3v9
	Ma9NF+zYED6ZX+9PqkHgsJLmjVA0XfivW4sbguQ==
X-Google-Smtp-Source: AGHT+IEgxGjpAfcQgJZPSZI09AOkDzjS2yiXb3qyIvWjw9VwAJvJ9LR53vE4/EKu6a8gJSxYcCVxmFt54915XaKYz7w=
X-Received: by 2002:a17:906:69a:b0:a5a:7ce8:f52c with SMTP id
 a640c23a62f3a-a62641b1fccmr653519166b.16.1716873163902; Mon, 27 May 2024
 22:12:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240527153137.271933-1-alexghiti@rivosinc.com> <ZlSuIu1aFLzAiH_1@krava>
In-Reply-To: <ZlSuIu1aFLzAiH_1@krava>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 28 May 2024 07:12:31 +0200
Message-ID: <CAHVXubhSXjFKP_7qfw0GMvrrVinwvCKizAiC2Xeu5EP6U0JpKQ@mail.gmail.com>
Subject: Re: [PATCH -fixes] bpf: resolve_btfids: Fix integer overflow when
 calling elf_update()
To: Jiri Olsa <olsajiri@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_221249_965091_9638AE49 
X-CRM114-Status: GOOD (  21.65  )
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

SGkgSmlyaSwKCk9uIE1vbiwgTWF5IDI3LCAyMDI0IGF0IDY6MDDigK9QTSBKaXJpIE9sc2EgPG9s
c2FqaXJpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIE1heSAyNywgMjAyNCBhdCAwNToz
MTozN1BNICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiBUaGUgZm9sbG93aW5nIGVy
cm9yIHdhcyBlbmNvdXRlcmVkIGluIFsxXToKPiA+Cj4gPiBGQUlMRUQgZWxmX3VwZGF0ZShXUklU
RSk6IG5vIGVycm9yCj4KPiBoaSwKPiB0aGlzIGZpeCBnb3QgYWxyZWFkeSBpbiwgY2hlY2sgdGhp
cyBwYXRjaDoKPiAgIGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9uZXRkZXZi
cGYvcGF0Y2gvMjAyNDA1MTQwNzA5MzEuMTk5Njk0LTEtZnJpZWRyaWNoLnZvY2tAZ214LmRlLwoK
RGFtbiwgSSBtaXNzZWQgdGhpcy4KCklmIHBvc3NpYmxlLCBJIHRoaW5rIHRoYXQgYWRkaW5nIHRo
ZSBsaW5rIHRvIHRoZSBidWcgcmVwb3J0IChvciBhdApsZWFzdCB0aGUgIkZBSUxFRCBlbGZfdXBk
YXRlKFdSSVRFKTogbm8gZXJyb3IiIHN0cmluZykgd291bGQgbWFrZQpzZW5zZSwgc2luY2UgaXQg
aXMgbm90IGEgInBvdGVudGlhbCIgb3ZlcmZsb3cgYW55bW9yZS4KClRoYW5rcywKCkFsZXgKCj4K
PiB0aGFua3MsCj4gamlya2EKPgo+ID4KPiA+IGVsZl91cGRhdGUoKSByZXR1cm5zIHRoZSB0b3Rh
bCBzaXplIG9mIHRoZSBmaWxlIHdoaWNoIGhlcmUgaGFwcGVucyB0byBiZQo+ID4gYSB+Mi41R0Ig
dm1saW51eCBmaWxlOiB0aGlzIHNpemUgb3ZlcmZsb3dzIHRoZSBpbnRlZ2VyIHVzZWQgdG8gaG9s
ZCB0aGUKPiA+IHJldHVybiB2YWx1ZSBvZiBlbGZfdXBkYXRlKCkgYW5kIGlzIHRoZW4gaW50ZXJw
cmV0ZWQgYXMgYmVpbmcgbmVnYXRpdmUuCj4gPgo+ID4gU28gZml4IHRoaXMgYnkgdXNpbmcgdGhl
IGNvcnJlY3QgdHlwZSBleHBlY3RlZCBieSBlbGZfdXBkYXRlKCkgd2hpY2ggaXMKPiA+IG9mZl90
Lgo+ID4KPiA+IEZpeGVzOiBmYmJiNjhkZTgwYTQgKCJicGY6IEFkZCByZXNvbHZlX2J0ZmlkcyB0
b29sIHRvIHJlc29sdmUgQlRGIElEcyBpbiBFTEYgb2JqZWN0IikKPiA+IExpbms6IGh0dHBzOi8v
YnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MjE4ODg3IFsxXQo+ID4gU2lnbmVk
LW9mZi1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgo+ID4gLS0t
Cj4gPiAgdG9vbHMvYnBmL3Jlc29sdmVfYnRmaWRzL21haW4uYyB8IDIgKy0KPiA+ICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvdG9vbHMvYnBmL3Jlc29sdmVfYnRmaWRzL21haW4uYyBiL3Rvb2xzL2JwZi9yZXNvbHZlX2J0
Zmlkcy9tYWluLmMKPiA+IGluZGV4IGQ5NTIwY2I4MjZiMy4uYWYzOTNjN2RlZTFmIDEwMDY0NAo+
ID4gLS0tIGEvdG9vbHMvYnBmL3Jlc29sdmVfYnRmaWRzL21haW4uYwo+ID4gKysrIGIvdG9vbHMv
YnBmL3Jlc29sdmVfYnRmaWRzL21haW4uYwo+ID4gQEAgLTcyOCw3ICs3MjgsNyBAQCBzdGF0aWMg
aW50IHNldHNfcGF0Y2goc3RydWN0IG9iamVjdCAqb2JqKQo+ID4KPiA+ICBzdGF0aWMgaW50IHN5
bWJvbHNfcGF0Y2goc3RydWN0IG9iamVjdCAqb2JqKQo+ID4gIHsKPiA+IC0gICAgIGludCBlcnI7
Cj4gPiArICAgICBvZmZfdCBlcnI7Cj4gPgo+ID4gICAgICAgaWYgKF9fc3ltYm9sc19wYXRjaChv
YmosICZvYmotPnN0cnVjdHMpICB8fAo+ID4gICAgICAgICAgIF9fc3ltYm9sc19wYXRjaChvYmos
ICZvYmotPnVuaW9ucykgICB8fAo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
