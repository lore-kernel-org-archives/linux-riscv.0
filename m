Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85E2FCCD1BF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Oct 2025 11:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05/NH497LtL6O5YnXgkR4ho9SiwfiUvS+fREDjTQ4PE=; b=YLFFetuUYZj5zK
	LxTDzodA/KbF4LaypRjdhqU63ZRNKHe9MKQGb9r3YzvW3qYNBTyqgVOnwLGZ4PMi06ToDvBDeaP9N
	V6G03AHljdCnAq8H4FJWC9iMn+iGs5vHSNqCxToQZq0kUfVWlHh3Eh3zPs3RQ5h+5HXRLHmLwgx9n
	OBD7c7++jekwKcZBIlppNkmb9y1CztGx+qkG1HTeKQe80gSAUKPNDAUqKM9qNr/t0gyH50sb/4ERP
	C3/K1J6l7npohBFwCwiQy6Jd/spyK5R52EYTjUPYkA7JNPf+w8uBjtB4u65bU2XugtG54DbYqMW37
	yhZvdjtJZdyc3WatPKfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCcuf-0000000BGOf-3FW8;
	Sat, 25 Oct 2025 11:58:25 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCcud-0000000BGOG-3ZQ2
	for linux-riscv@lists.infradead.org;
	Sat, 25 Oct 2025 11:58:25 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-54bc08ef45dso1946573e0c.1
        for <linux-riscv@lists.infradead.org>; Sat, 25 Oct 2025 04:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761393502; x=1761998302; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8I9TkdogdsV9nixdXBith0cDlYgPpHBpTVoAhEFR6cE=;
        b=WTPMref5Dx2Eug1H6g0f/jbujDw2j3uFsWtg+YrbQlkFKhJZDbuHnhkcjCVaCqNeS+
         UL5qKYE1BSiTB5XCXmYdPQSWgMiHYnPpBt0vX/18+RMwImaSa97MhQv4dW8FHKk97VVm
         igy3UddRhdGJ2XF9kWpmTyqidMFnKbeYcLoGqwFMk3L+GzU+OPxQl33RbTiMoBSf3quj
         uDe2DPoDw/NMrXhKWhyeVSpklGSx/u1id4IMGQQz92KFhzw5xA3xlTFXzDFxY/iqNR8g
         7yMxCBtkRSDotMZWb3ywOq058mwuBNJ1aRH7yLdP8v79qAQEcexQ1Somo7Z+2n7DIiTE
         gsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761393502; x=1761998302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8I9TkdogdsV9nixdXBith0cDlYgPpHBpTVoAhEFR6cE=;
        b=DCiFpTN4adToGClBBHMYhxjDE2G2nhdwARPnvWEVU1NLCN/+i+BtbuZ9y2U7phLNb2
         w2Y+apP53YACr9R2IVIrrBGUtXCCONJhPGb8tck14l8Fta15qEsIqglLEGigIl5dB/zR
         2mXiDxeYpdzyTC8CFD5W83QsHivHZzNymzdeSDxLDgHn+8WwIM93QDK0VgO4zlvVNo0V
         N20oBH5/tNzkHgb7MAfSMcO/IVSoFqSrYc71AcbgEQwM5eTeiqfXetqydwbfIn/Z26nf
         HXnhzo0xGy8t4olLD4nVzjFLAJ4KoMZIxJc/8jjx7tGbnctZ0dFzH/SgVuIeuAW1CNP3
         36+g==
X-Forwarded-Encrypted: i=1; AJvYcCWkW9gINz9S8N1v1ftdMdoG+UeZka/G8i0bFAse7Q/3wtiL2t/l3ZarN3HZMGlfx38az54lMUa5eT052A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7sFARTeFBMO3JLD8eA7+RrKmUojLKsPwmN3LLPSEYKU5rj4vo
	8mApXclx6kzKOIl/fqGxwQlm1F6flC/5b5IRqj5XoOZAXwAQGCaKdteS3z1gnIZnlxT1JngXDoC
	gtEcAm6IwFLpe+PIfVb/8aCe3o5eYbN0=
X-Gm-Gg: ASbGncuaSBa1+UDe1XtJK/TBLjszRQCRx2BxM7Wij2GJ/lI+BYjCM8E6RDLRKjd8EMt
	UTNJUFCOIsx48r0mZzzIrzXP/5XQMbCUjTCr4/0KRUFOKGbIaYK0lIoLa3vhOO7iPC0b2AVRnWN
	Ia0YgVp/J3UzMkzq85iThFiFAHLtMI1S/T1F72Z7S1JNm/xml5bihqK3RSk/WkRgQVcONKbDmlh
	1Na7SX1AeKlzFe9qreZYba31OmFGwQ4GQNehzlIOGFfgU+oZWZC9gI3jH1Q4CXs5InzoHww
X-Google-Smtp-Source: AGHT+IEjjxEtU4jsBOkQ9KzzJg48mbR9wHZxw8HVS/t5afsmBknagybFZ4yDuSvqyYJYMpWyOtsSCOSfKUdve+9kw7s=
X-Received: by 2002:a05:6122:e1dc:b0:556:9cb9:65c8 with SMTP id
 71dfb90a1353d-5569cb9739fmr2881748e0c.0.1761393501810; Sat, 25 Oct 2025
 04:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1760929111.git.unicorn_wang@outlook.com> <PN6PR01MB1171791524E2BC1C227E342F6FEF5A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN6PR01MB1171791524E2BC1C227E342F6FEF5A@PN6PR01MB11717.INDPRD01.PROD.OUTLOOK.COM>
From: Han Gao <rabenda.cn@gmail.com>
Date: Sat, 25 Oct 2025 19:58:10 +0800
X-Gm-Features: AWmQ_bkPkZoLoqCmIL-grA_sDMwqczj2smKSV0IWSOxGD1NzJo1hieHmZhU-890
Message-ID: <CAAT7Ki_4nkKM1-D_8ybwusxTTsR=Lf09v8Cx6QDWfuy8KLtbBg@mail.gmail.com>
Subject: Re: [PATCH 0/4] Add PCIe support in DTS for Sophgo SG2042 SoC
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, conor+dt@kernel.org, 
	inochiama@gmail.com, krzk+dt@kernel.org, mani@kernel.org, 
	liujingqi@lanxincomputing.com, palmer@dabbelt.com, pjw@kernel.org, 
	robh@kernel.org, tglx@linutronix.de, sycamoremoon376@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, chao.wei@sophgo.com, 
	xiaoguang.xing@sophgo.com, fengchun.li@sophgo.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251025_045823_898448_CD397DF2 
X-CRM114-Status: GOOD (  20.41  )
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

T24gTW9uLCBPY3QgMjAsIDIwMjUgYXQgMTE6NDnigK9BTSBDaGVuIFdhbmcgPHVuaWNvcm5fd2Fu
Z0BvdXRsb29rLmNvbT4gd3JvdGU6Cj4KPiBoaSwgSGFuIEdhbywKPgo+IFBsZWFzZSBoZWxwIHRl
c3QgdGhpcyBvdXQgb24gRVZCLCBJIGRvbid0IGhhdmUgdGhvc2UgYm9hcmRzIGFuZCBqdXN0Cj4g
dGVzdGVkIHdpdGggbXkgcGlub2VlcmJveC4KPgo+IFRoYW5rcywKPgo+IENoZW4KPgo+IE9uIDEw
LzIwLzIwMjUgMTE6MzIgQU0sIENoZW4gV2FuZyB3cm90ZToKPiA+IEZyb206IENoZW4gV2FuZyA8
dW5pY29ybl93YW5nQG91dGxvb2suY29tPgo+ID4KPiA+IFRoaXMgbmV3IHBhdGNoIHNldCBpcyBh
IGNvbnRpbnVhdGlvbiBvZiB0aGUgcHJldmlvdXMgcGF0Y2hzZXQKPiA+ICJbUEFUQ0ggdjMgMC83
XSBBZGQgUENJZSBzdXBwb3J0IHRvIFNvcGhnbyBTRzIwNDIgU29DIiBbMV0uCj4gPgo+ID4gVGhl
IGRyaXZlcnMgYW5kIGJpbmRpbmdzIGhhdmUgYWxyZWFkeSBiZWVuIG1lcmdlZCBpbnRvIHRoZSBr
ZXJuZWwKPiA+IG1haW5saW5lLCBhbmQgdGhpcyBwYXRjaHNldCB3aWxsIGZvY3VzIG9uIHN1Ym1p
dHRpbmcgdGhlIHJlbWFpbmluZwo+ID4gRFRTIGNoYW5nZXMgaW50byB0aGUgbWFpbmxpbmUuCj4g
Pgo+ID4gVGhpcyBwYXRjaHNldCBpcyBiYXNlZCBvbiB2Ni4xOC1yYzEgYW5kIHRoZSBvbmx5IGNo
YW5nZXMgc2luY2UgdjMKPiA+IGlzIGEgZml4IHRvIGFkZHJlc3MgdGhlIGNvbW1lbnRzIGZyb20g
TWFuaXZhbm5hbiBTYWRoYXNpdmFtIHRvIG1ha2UKPiA+IHN1cmUgUENJIGFkZHJlc3Mgb2YgdGhl
IEkvTyBwb3J0IHRvIHN0YXJ0IGZyb20gMC4KPiA+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi9jb3Zlci4xNzU3NjQzMzg4LmdpdC51bmljb3JuX3dhbmdAb3V0
bG9vay5jb20vIFsxXQo+ID4KPiA+IENoZW4gV2FuZyAoNCk6Cj4gPiAgICByaXNjdjogc29waGdv
OiBkdHM6IGFkZCBQQ0llIGNvbnRyb2xsZXJzIGZvciBTRzIwNDIKPiA+ICAgIHJpc2N2OiBzb3Bo
Z286IGR0czogZW5hYmxlIFBDSWUgZm9yIFBpb25lZXJCb3gKPiA+ICAgIHJpc2N2OiBzb3BoZ286
IGR0czogZW5hYmxlIFBDSWUgZm9yIFNHMjA0Ml9FVkJfVjEuWAo+ID4gICAgcmlzY3Y6IHNvcGhn
bzogZHRzOiBlbmFibGUgUENJZSBmb3IgU0cyMDQyX0VWQl9WMi4wCj4gPgo+ID4gICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDItZXZiLXYxLmR0cyAgfCAxMiArKysKPiA+ICAgYXJj
aC9yaXNjdi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLWV2Yi12Mi5kdHMgIHwgMTIgKysrCj4gPiAg
IC4uLi9ib290L2R0cy9zb3BoZ28vc2cyMDQyLW1pbGt2LXBpb25lZXIuZHRzICB8IDEyICsrKwo+
ID4gICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby9zZzIwNDIuZHRzaSAgICAgICAgfCA4OCAr
KysrKysrKysrKysrKysrKysrCj4gPiAgIDQgZmlsZXMgY2hhbmdlZCwgMTI0IGluc2VydGlvbnMo
KykKPiA+Cj4gPgo+ID4gYmFzZS1jb21taXQ6IDNhODY2MDg3ODgzOWZhYWRiNGYxYTZkZDcyYzMx
NzljMWRmNTY3ODcKCkVWQjEuWC8yLjAgY2FuIGJlIHN0YXJ0ZWQgbm9ybWFsbHkuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
