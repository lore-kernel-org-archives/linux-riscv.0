Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08E00C5AD49
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 14:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QCyX2PiSaBnesy0RR7QXEpTa9E6sgWr4r2QUhzYdBOY=; b=2H9m8bCBacuxKx
	+zdcGZri1heabH6aAnPlMFAB46OECjBRi6ZO/QIbLU8kV0hmIFi2oCwUQ4GOvg8CdUflFpe6nfL/2
	lOQYwvRW/bXXqsOXuX2COm+oWX8Axr25hbVIVGFR2A9A02AJ0J8mQJjGYvXAsJQJi48hyWR8ZK+1M
	SWCYVMtC8Gjd3Q328ZwL+92mkzy6z8WZop/sTwPPP9RThLZjtrT79Oe+IeqnTbi/aY+mG0vzjVT9B
	iH71aEPli0RRk/wzmAgUQL21X3623XtMfZ28PaL2wg2QEYjJq7Oorc8JFzY7MH7siDGSNj16mLs5o
	iU4nxHWJmskPKWA/IqEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMSJI-0000000B8Du-3upY;
	Tue, 03 Jun 2025 14:08:12 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMS20-0000000B5gt-1VP8
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 13:50:21 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-4a43e277198so40308331cf.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jun 2025 06:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1748958619; x=1749563419; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=hGOTl4yOISHWe/xIfaFHWdtlB720wdTPFkmgfLyjbZDlzwyuiozqjMMQ92Fl2BvV2W
         lUmACY3PF2OP302IwE8q62kub3juMHRa+Kd5qhWnBjGKchlyrhd0pGNlpVH31AGT1hFN
         Ht7Pkfyr7mqgTvVJEUvGF3H1IxCb+x81GijVpz0fRofRHXRUWIjTmIIyqXWfYGc/yAnF
         69Wr8ilpzSKLA16A6fApMBjoKla6354ddEgCbwdMn1gY3dubaok/uuB9MVcXcL/7K3Lv
         wg0UNSvJzFFJJbqBrRiP0vPkHjI1a1m5gBe11hinQwqOSZALC1aIqo2rEHs2ExOteSbf
         ZYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748958619; x=1749563419;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YkymsPnXdQBda6JrJEhL1GWpprQuWSyxObGqKIJXWus=;
        b=rNo2bAXs0nfyuq2mdBaQNKpPrRL1WmBqrWylqwbL6H0WdpZ/m21cGCsSn1o1YrvpGt
         ZxU8ZRWmkcxEl8EpjkxYVLCrTm4zGb11znCAPOkjGui/sGGOLhC6zYAhzpBM4M4tca3D
         SZzhoLGSFs3Lcrvydm5F01dQVClT22M73S40EOFlrgmCck6igBXPVjMGUUXaSs0oRpw/
         SrKemRkcCl3HNjCsn+giXEmDROdQvXnppTTqZV590eTV1kRkm/p8JdGKBEugnG+gMaVz
         8hN7HurdbWLN9rBSaowPZ7vsygHWm3G3LIWxdT2UIbU5fMH3KO2mRQ/KCTHVGtS3qDFl
         kFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTwDkJpq89A4QxUMmu2AE/oc+UUqQzxpwGRSY+tiMlLIpEKCwkeRIvTj8Mzq6zfZP8qpHy8OAXWxvW8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvYOd42LPyzzNyVR/PFBMWrjQEv19pRkeFNN3VVd7dwXs7tHFg
	PAxcBZOKh2J/mRmtwawYN5F2tjGdCJdYzwGKi0v2s/4JywvV8Z/uaf3hEkVPIWBvUGk=
X-Gm-Gg: ASbGncu42th88HLI2gfFCHnEud93YoFGdSSo3gPDQF5qtvRVS9tiXfUEMgyU5pdgyVP
	QMrMOehXGHS/mnO2yXH3SWbiKSNri9ctVbbA1EoAnUqFt6LliMRUL2IhUbHRbOGEU8Cv8raM6T/
	b0hArb34OtiFgMvcfuViCCEcqr/DauUZsvojdkv+85AVDfo1fk7mnrFztYRlZwS82XSrAInVr6t
	YFj65wm0Hexa43K0PdPmQihv6Q1pxvjOCNJgqbs0ua7gLvBg58Ph5cgMSud9cncG/E8QE44eNmz
	I8cx2aWtnP2Zv06bBmeDV088UKjGAoM7P1szCl9K9z9Hy0Sf5w2UY/p8fPVs+Wx4PkXOmjPEAKd
	Ds1i+EB/5q2ALP4+BP0GHWb77tOI=
X-Google-Smtp-Source: AGHT+IFrQ3mNOrW6/ZBr5BKf2weoO3iOKbQMChhnKb6iKzSLwy4jyxYkXr8u6rUugOKC/0R4gbcrnw==
X-Received: by 2002:a05:622a:4d96:b0:4a4:3171:b942 with SMTP id d75a77b69052e-4a4aed86ba3mr229299171cf.39.1748958619327;
        Tue, 03 Jun 2025 06:50:19 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-167-56-70.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.167.56.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a4358eef6csm75933171cf.48.2025.06.03.06.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 06:50:18 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uMS1y-00000001hCj-1MTz;
	Tue, 03 Jun 2025 10:50:18 -0300
Date: Tue, 3 Jun 2025 10:50:18 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alistair Popple <apopple@nvidia.com>
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
	dan.j.williams@intel.com, willy@infradead.org, david@redhat.com,
	linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
	zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
	balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org,
	John@groves.net, Will Deacon <will@kernel.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
Subject: Re: [PATCH 10/12] mm: Remove devmap related functions and page table
 bits
Message-ID: <20250603135018.GK386142@ziepe.ca>
References: <cover.541c2702181b7461b84f1a6967a3f0e823023fcc.1748500293.git-series.apopple@nvidia.com>
 <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32209333cfdddffc76f18981f41a989b14780956.1748500293.git-series.apopple@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_065020_401414_DDE09924 
X-CRM114-Status: GOOD (  10.16  )
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

T24gVGh1LCBNYXkgMjksIDIwMjUgYXQgMDQ6MzI6MTFQTSArMTAwMCwgQWxpc3RhaXIgUG9wcGxl
IHdyb3RlOgo+IE5vdyB0aGF0IERBWCBhbmQgYWxsIG90aGVyIHJlZmVyZW5jZSBjb3VudHMgdG8g
Wk9ORV9ERVZJQ0UgcGFnZXMgYXJlCj4gbWFuYWdlZCBub3JtYWxseSB0aGVyZSBpcyBubyBuZWVk
IGZvciB0aGUgc3BlY2lhbCBkZXZtYXAgUFRFL1BNRC9QVUQKPiBwYWdlIHRhYmxlIGJpdHMuIFNv
IGRyb3AgYWxsIHJlZmVyZW5jZXMgdG8gdGhlc2UsIGZyZWVpbmcgdXAgYQo+IHNvZnR3YXJlIGRl
ZmluZWQgcGFnZSB0YWJsZSBiaXQgb24gYXJjaGl0ZWN0dXJlcyBzdXBwb3J0aW5nIGl0Lgo+IAo+
IFNpZ25lZC1vZmYtYnk6IEFsaXN0YWlyIFBvcHBsZSA8YXBvcHBsZUBudmlkaWEuY29tPgo+IEFj
a2VkLWJ5OiBXaWxsIERlYWNvbiA8d2lsbEBrZXJuZWwub3JnPiAjIGFybTY0Cj4gU3VnZ2VzdGVk
LWJ5OiBDaHVueWFuIFpoYW5nIDx6aGFuZy5seXJhQGdtYWlsLmNvbT4KPiBSZXZpZXdlZC1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBEb2N1bWVudGF0aW9u
L21tL2FyY2hfcGd0YWJsZV9oZWxwZXJzLnJzdCAgICAgfCAgNiArLS0KPiAgYXJjaC9hcm02NC9L
Y29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDEgKy0KPiAgYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9wZ3RhYmxlLXByb3QuaCAgICAgICAgIHwgIDEgKy0KPiAgYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAgICAgIHwgMjQgKy0tLS0tLS0tCj4gIGFyY2gv
bG9vbmdhcmNoL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICstCj4gIGFyY2gv
bG9vbmdhcmNoL2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oICAgICB8ICA2ICstLQo+ICBhcmNo
L2xvb25nYXJjaC9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggICAgICAgICAgfCAxOSArLS0tLS0tCj4g
IGFyY2gvcG93ZXJwYy9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAxICstCj4g
IGFyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvaGFzaC00ay5oICB8ICA2ICstLQo+
ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L2hhc2gtNjRrLmggfCAgNyArLS0K
PiAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Jvb2szcy82NC9wZ3RhYmxlLmggIHwgNTMgKy0t
LS0tLS0tLS0tLS0tLS0tLQo+ICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzY0L3Jh
ZGl4LmggICAgfCAxNCArLS0tLS0KPiAgYXJjaC9yaXNjdi9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDEgKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLTY0
LmggICAgICAgICAgIHwgMjAgKy0tLS0tLS0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLWJpdHMuaCAgICAgICAgIHwgIDEgKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggICAgICAgICAgICAgIHwgMTcgKy0tLS0tLQo+ICBhcmNoL3g4Ni9LY29uZmlnICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgfCAgMSArLQo+ICBhcmNoL3g4Ni9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmggICAgICAgICAgICAgICAgfCA1MSArLS0tLS0tLS0tLS0tLS0tLS0KPiAgYXJjaC94
ODYvaW5jbHVkZS9hc20vcGd0YWJsZV90eXBlcy5oICAgICAgICAgIHwgIDUgKy0tCj4gIGluY2x1
ZGUvbGludXgvbW0uaCAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA3ICstLQo+ICBpbmNs
dWRlL2xpbnV4L3BndGFibGUuaCAgICAgICAgICAgICAgICAgICAgICAgfCAxOSArLS0tLS0tCj4g
IG1tL0tjb25maWcgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstCj4g
IG1tL2RlYnVnX3ZtX3BndGFibGUuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDU5ICstLS0t
LS0tLS0tLS0tLS0tLS0tLQo+ICBtbS9obW0uYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgMyArLQo+ICBtbS9tYWR2aXNlLmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgOCArLS0KPiAgMjUgZmlsZXMgY2hhbmdlZCwgMTcgaW5zZXJ0aW9ucygrKSwg
MzE4IGRlbGV0aW9ucygtKQoKUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG52aWRp
YS5jb20+CgpKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
