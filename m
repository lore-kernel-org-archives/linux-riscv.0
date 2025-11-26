Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B19AD11181
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 15:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cdZgqU4x4ASLql3rafU59reRfAInBra0trGfYKpQepk=; b=eC0waVH2BsZZAM
	MoQMrxfcdjymWWQe+kTP62JoS4jHwGZET9ZvMnmY9VCYrvaIaeO6WFj/f6AS2anv+cAxbdsSyImQ0
	aUPi2h20JnSLhMEipNn7DtAKejyGAyPD/QeZab/mv2ah+Az/nJVaIWC+BR5L2bVbCxi0scYdL4cej
	VwxokIG2CZapW7wMtvZ/awz9x2Tp7atzwn7nUvjOMbPfFLopL3uoSb+QMSsHD9OsN4zFbk5PSQA8X
	esgV5xoWDv4RkAS+5l6RQWhuj79cYgHxlrPV9x8OsaJDfQ/pb5BhojvRAjGqkjNxx8I3maIT/7UHT
	mD3+OqI1NVi0wZEEkevA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHuO-0000000FDSF-3UWb;
	Wed, 26 Nov 2025 15:58:20 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHuN-0000000FDRo-1k9r
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 15:58:20 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7b9387df58cso10871125b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 07:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764172698; x=1764777498; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6coizwMX32tnMFy7SCv4fyC/T1+n7CiPp+H9M25tD1k=;
        b=GYxOnWiYnuJQzkyZvCvYXRaKtv7G7RA2nr2q3yBgRPY2p7RamTM++Z2XWyye13RWLb
         gg9c5LORcAlSGjxjcYYzL+K5VUZ3jrNpo8bVSXJ5OC3yQZHoHyBtO9uiZK0evfCJXibp
         W6qD5SjOBHi+7ggMPmxqAxA96BEPKr1xzQEij2QyGIGMy3jOY1nSWPHlN3kpAHDmYGwU
         fTdEDTy/vAKWavb5xyj/HKtvDQcdds4dPJfF/l7VW+HpTrSMnUB7+AAj2SChp4u/Z5sZ
         Ts4+Nz2OI+8f7esr+bhHJs0ea+NZcQq1ER+KN5nARpFbIho/jo35fiovLgJN09KJeYh0
         Sk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764172698; x=1764777498;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6coizwMX32tnMFy7SCv4fyC/T1+n7CiPp+H9M25tD1k=;
        b=OmZiyz9yYn+7CXVaCz7M8oLXxL6jl6HjemCJJHnT+G2T9Pf5Fjaj+xib5lY3V+UJMG
         08LNT+RvE0JLHKYLkKP1slM39DSKUp9GPr4Uyk1xMMXOOFbvXFIv3MKbunQEl3IeW5Ti
         8h1saLho1M6RFU6Py3lxVXUVIdE+Wdc5T7rkNBZQ7AjmbH5Kg6fFvpNw30PYEYYiCQ+1
         Ukq0rQUfq99xrAFzdSXF4deXnbgBALot2JqjbBz6nhva3iw0mlflOpIPPD/33uuUPsf1
         RFxn3zat8WgDfpZPexHMGto+xiExIJAdYPcJXuoJV/HFdNtO3NPXhcq1Q+rGKJAEQp3x
         oe9w==
X-Forwarded-Encrypted: i=1; AJvYcCU+XhX/mBTr/AfXkiRCtJtx4pHQp3Nc3sdHVy0q4kw6jcUM2rx4aMUl+YCGpsKEb5f2iEMHqw/c2SdB7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpnl0259tqLQy7YatGNCxDGHiWQ93Qst0wAdDGj096Xs5B3lrL
	cdF3fYzfRP/lnTwCELWsv6+hUUlU8NzKjzcAKvDKHDXhsZDYl8maTphL
X-Gm-Gg: ASbGncupZ+fus/0DY6A2btGmsQeA3yWvYs8mOGT+bWYDQfH2sONR8+FqDkTMF9z2/hI
	pnsEQbs0YmHf3bMytI8jiNdpayzdcReVZ+Fb4A/25JlS+dad21qqOWIB3cgSw0Mkv7zJjsYlngi
	847UWFqaod1b0NRnsK5TZXBpeNbDwBdmbWYAPXxtXed3BRnIGktahtjQs4z3maelrWo2l4UNi0k
	i2zIVgX22nRsDlQ7hjpH7MHCiCUdnoCE+UHblBqjN7CNalvHb7ROn55TjoITylE151cn7n7FYRI
	rFkYsyVlf2nZ9xC8kv2Kg3o8DYcZUTQduS3ULr0h9hqIc51Sp3qp2xDsalPMHMPraKAKzSFV4Tl
	GArnKVXfVFoi662sgDvk2apBccZM7cA7rDpvAtPdHFxPVgBhg2820mHNHCtsKAjK17VCA0Xb/Ai
	Gx32xwnufADnTeXk5m9uvjxjM=
X-Google-Smtp-Source: AGHT+IEAlrEBX63dNuljqMvsO08ZhEyk1nD47uVvFnK6rNCBnZjVQlF3NDTXlkiQ1hlZiiZ6Qsu8Wg==
X-Received: by 2002:a05:7023:b89:b0:11b:3742:1257 with SMTP id a92af1059eb24-11cbba4a6aemr6896636c88.34.1764172698336;
        Wed, 26 Nov 2025 07:58:18 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93de82c1sm68952231c88.3.2025.11.26.07.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 07:58:17 -0800 (PST)
Date: Wed, 26 Nov 2025 07:58:17 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] of: Skip devicetree kunit tests when RISCV+ACPI doesn't
 populate root node
Message-ID: <04241600-c5f7-4b49-80e0-ad4d58355623@roeck-us.net>
References: <20251023160415.705294-1-linux@roeck-us.net>
 <176297731621.2151636.2516355929483523874.robh@kernel.org>
 <f5cc4e3e-ef66-7786-f9b5-f9d5f0846386@kernel.org>
 <CAL_JsqKzLARKeM8xP+TeVhuksth7F9p8kaU7KtRxHFe=q1Q=9w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAL_JsqKzLARKeM8xP+TeVhuksth7F9p8kaU7KtRxHFe=q1Q=9w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_075819_457931_F4D6ABA2 
X-CRM114-Status: GOOD (  18.42  )
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

T24gVGh1LCBOb3YgMjAsIDIwMjUgYXQgMDc6MDY6NDZQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gT24gVGh1LCBOb3YgMTMsIDIwMjUgYXQgODo1M+KAr1BNIFBhdWwgV2FsbXNsZXkgPHBq
d0BrZXJuZWwub3JnPiB3cm90ZToKPiA+Cj4gPiBIaSBSb2IsCj4gPgo+ID4gT24gV2VkLCAxMiBO
b3YgMjAyNSwgUm9iIEhlcnJpbmcgKEFybSkgd3JvdGU6Cj4gPgo+ID4gPiBJIGd1ZXNzIHRoZSBy
aXNjdiBmb2xrcyBkb24ndCBjYXJlIGFib3V0IHN1cHBvcnRpbmcgdGhlIHJlbGV2YW50Cj4gPiA+
IGZlYXR1cmVzIGVpdGhlciwgc28gSSd2ZSBhcHBsaWVkIGl0LiBDYW4ga2lja2VkIGRvd24gdGhl
IHJvYWQgYWdhaW4uCj4gPgo+ID4gRm9yIHRoZSByZWNvcmQ6IHdlIGRvIGNhcmUuICBIb3dldmVy
LCBpdCBsb29rcyBsaWtlIHRoaXMgcHJvYmxlbSBuZWVkcyBhCj4gPiBtb3JlIGdlbmVyYWwgc29s
dXRpb24sIHNvbWV0aGluZyB0aGF0IGFwcGxpZXMgYWNyb3NzIENQVSBhcmNoaXRlY3R1cmVzLgo+
ID4gTGFja2luZyB0aGF0LCB3ZSBtaWdodCBhcyB3ZWxsIGhhdmUgYmVoYXZpb3IgY29uc2lzdGVu
dCB3aXRoIEFSTTY0IC0gYW5kCj4gPiBmb3IgaXRzIGZhdWx0cywgdGhpcyBhcHByb2FjaCBpcyBh
dCBsZWFzdCBzaW1wbGVyIHRvIHJlYXNvbiBhYm91dC4KPiAKPiBUaGUgdGhpbmcgaXMgdGhhdCBw
cm9ibGVtcyBzaG93IHVwIG9uIHNwZWNpZmljIG1hY2hpbmVzIHdoaWNoIGhhcwo+IGxpdHRsZSB0
byBkbyB3aXRoIHRoZSBzcGVjaWZpYyBDUFUgYXJjaC4gSSBkb24ndCBoYXZlIGFueSB2aXNpYmls
aXR5Cj4gYXMgdG8gd2hhdCBwcm9ibGVtIHlvdSBhbGwgaGFkIHdoaWNoIHByb21wdGVkIGRpc2Fi
bGluZyBpdCAoZm9yIHRoZQo+IGFyY2gsIG5vdCB0aGUga3VuaXQgdGVzdHMpIHRvIGJlIGFibGUg
dG8gdGhpbmsgYWJvdXQgYSBzb2x1dGlvbi4KPiBMZWF2aW5nIGl0IG9mZiBqdXN0IG1lYW5zIHdl
J3JlIHBvdGVudGlhbGx5IGFkZGluZyByZWdyZXNzaW9ucyBpbiB0aGUKPiBmdXR1cmUgd2hlbiB3
ZSB0cnkgdG8gdHVybiBpdCBvbi4KPiAKClNpbmNlIHRoZSBwYXRjaCBpbnRyb2R1Y2luZyB0aGUg
cHJvYmxlbSBoYXMgbm93IGJlZW4gYmFja3BvcnRlZCB0byB2Ni4xMgphbmQgdjYuMTcsIEkgZGlz
YWJsZWQgQ09ORklHX09GX0tVTklUX1RFU1QgZm9yIHJpc2N2IGVudGlyZWx5IGluIG15IHRlc3QK
c3lzdGVtLgoKR3VlbnRlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
