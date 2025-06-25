Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B9CC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 14:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EmFLU+1kjwZNV3bl+7B5N5tO0VdCryrQLMoC9ZzieiI=; b=Z774x8rzx8JdHx
	B4odrvoui5Fex+Y45SxF4no7H5O6cXpgA6bnz0k1Mrac4hdldIfjSxY7l7h7/PuSh5Ln9TQlE++Qu
	ZXNl/oFdUIUfE1ZdOT7dlXvIcEmpKFffG5BFsyS6Ax+nBkvtPABH62xAasrQbp5zuDvBGvGSsSkmo
	DX1HzMsIOoh8c8xG5sXvNeGHItd/SlfSITS4rnGd57dQkcl5Hon80fKrkEVy7/uji5w/hMvzc0MNW
	p5ontDEu5FtwI2rycXXXI4Mkls111ejoh6/h2xjMgxt1j2jJE4OAzl8MNZpbVX4/Pw8MipRSXRbBc
	Db8nPvM05sm9WoZP9+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURL3-000000090El-0fe2;
	Wed, 25 Jun 2025 14:43:01 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO6P-00000008RVF-2WnC;
	Wed, 25 Jun 2025 11:15:43 +0000
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-532de49b7e2so683181e0c.0;
        Wed, 25 Jun 2025 04:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750850140; x=1751454940; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UzzWoBYzuELzHA/ZeU/yfgoxYFcBOEqkCLdhulSDso8=;
        b=b1SsTOsrvga25BsCuwmDlcWxv+o0gBX+ukxLBaXf9uxtYdlkZ+DZLV7reub+K47Smn
         n1rYM2LISa1Sf1S/ONy/1eyn5BJfh7IyumrwBmYkFpF+/gLGOa3T7Jxt17MR+TzcOI2m
         w3AB4MZR/z67n/5kSVtf6lUaJXmoiq9zwRgt6XMdUaqHm3RVCrxCcYtelcktUtqGttZT
         LsBCUnpVjK+/GiI0DRE05g9rYz44Mw/1aZShA55S8a0i2pmbLd0jdsIM/Zv/QX81tWfw
         BeaKCo+oDrauP9GWEnCEOCG/zg8wc32Lxt2XbzjuP4WGf7E3ZIPTwHGIFdZmlYEErEfs
         XXVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750850140; x=1751454940;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UzzWoBYzuELzHA/ZeU/yfgoxYFcBOEqkCLdhulSDso8=;
        b=losl/VNCBhXYr/aK+GPoOFh2TKNxZTt6pN4BDN296i/mozioIjSd3zoo+VOkhPQwLs
         xzZv6CYbK9wemZ5RfPvKUPBSfRBnDF9mNFkTsGn07Mu8Mjqn+saP1nijGPwg99n574qH
         7WZ/7eP8KidUgSlkuhSafKks76nztlX/v+Qm+75tgzirzG3vxQ68N0gjwCDE9WkXL/QW
         AZSdY29zpGqL3/zHgaN0uG7GBz0gj7lCQDFd2QrhmSK1gMEd3ScKt09Zz/MV9VDlZqMl
         0oKE49+IRIjb3Fc5IZ8QsPaNqPjhbA0fiYUpM+IgUS8QZAQVuGsgHDrkerOalDK5jKz+
         bIvA==
X-Forwarded-Encrypted: i=1; AJvYcCWTprXvgFnT6CHc4PgxD01udZt5XH6eLmmXYPdqcapONylpf3Cz7SHGIFACosDI8Rr+1ZTsf7KEPWfuUUQQvbAs@lists.infradead.org, AJvYcCXV7Erxnqe0++UG3ZIuL9MhfB9hWA4fHgUCC8bMFD1oaO/6xR7dJs0lHRD1VEdyoL72Z+3r+JFkVwS3nIE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw26apd8OyDNshFEgH454z1/jFPjj5a5Ab/AUh5xAD+C95GPKwD
	ypLnHgTVDhH22eDKAxdBX8Y7UVImqg1WiN/P42jztpmzxzrrDykHNbEvsVXpqSOFTqHiWArKSJC
	8A9BljJV1rd+qumyY15JbmK9tPQBvB6A=
X-Gm-Gg: ASbGncvS+/83pKfGvqUo4Xi2L/aRnLZE8i0DcCS3U+5+n6ykooXtck6X7+NpKb3xhyI
	2aatzezV2t8cKbj9aAwPkginmEGWKsI8l4RJS+sL3GoOBcwfEgeN5U/bFh3DlTESElUVafDyAO5
	2Muf+QrRDKWDQXGuAjsFwA0h8JkNpnGGN2qZkc+IRqtG9V6sQU1Pb4cQ==
X-Google-Smtp-Source: AGHT+IHwxdbJNROelzY3OknT3azAp92ywQE88MfIFFnBydzATnoYswUHYfRj+B3vYRzmFHBdJZPqRWnqwsEAdwdY54w=
X-Received: by 2002:a05:6122:1ac9:b0:531:19ee:93ea with SMTP id
 71dfb90a1353d-532ef208beamr1331489e0c.0.1750850140366; Wed, 25 Jun 2025
 04:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <2c19a6cf-0b42-477b-a672-ed8c1edd4267@redhat.com>
 <20250624162503.78957-1-ioworker0@gmail.com> <27d174e0-c209-4851-825a-0baeb56df86f@redhat.com>
 <938c4726-b93e-46df-bceb-65c7574714a6@linux.dev> <CAGsJ_4y1GObH-C7R=FQL=UWe3kF6qhKoRqPxNPYx0k7uwocc+g@mail.gmail.com>
 <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
In-Reply-To: <5ba95609-302b-456a-a863-2bd5df51baf2@redhat.com>
From: Barry Song <21cnbao@gmail.com>
Date: Wed, 25 Jun 2025 23:15:29 +1200
X-Gm-Features: Ac12FXzIwn089IFe1tMYOckn8MZY5eni2aX8dcGFabAwMmxZ1sP0z4GGek9WzJY
Message-ID: <CAGsJ_4zSGT05GjxM1H6JwSa5MhgtxaiYVa1Wtvm8+SmYkm=jmQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large
 folios during reclamation
To: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <lance.yang@linux.dev>, akpm@linux-foundation.org, 
	baolin.wang@linux.alibaba.com, chrisl@kernel.org, kasong@tencent.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
	lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, v-songbaohua@oppo.com, 
	x86@kernel.org, ying.huang@intel.com, zhengtangquan@oppo.com, 
	Lance Yang <ioworker0@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_041541_642906_1E2E0D5A 
X-CRM114-Status: GOOD (  29.30  )
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

T24gV2VkLCBKdW4gMjUsIDIwMjUgYXQgMTE6MDHigK9QTSBEYXZpZCBIaWxkZW5icmFuZCA8ZGF2
aWRAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBPbiAyNS4wNi4yNSAxMjo1NywgQmFycnkgU29uZyB3
cm90ZToKPiA+Pj4KPiA+Pj4gTm90ZSB0aGF0IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB3aHkg
d2UgaGF2ZSB0byBiYXRjaCB0aGUgd2hvbGUgdGhpbmcKPiA+Pj4gb3IgZmFsbGJhY2sgdG8KPiA+
Pj4gaW5kaXZpZHVhbCBwYWdlcy4gV2h5IGNhbid0IHdlIHBlcmZvcm0gb3RoZXIgYmF0Y2hlcyB0
aGF0IHNwYW4gb25seSBzb21lCj4gPj4+IFBURXM/IFdoYXQncyBzcGVjaWFsCj4gPj4+IGFib3V0
IDEgUFRFIHZzLiAyIFBURXMgdnMuIGFsbCBQVEVzPwo+ID4+Cj4gPj4gVGhhdCdzIGEgZ29vZCBw
b2ludCBhYm91dCB0aGUgImFsbC1vci1ub3RoaW5nIiBiYXRjaGluZyBsb2dpYyA7KQo+ID4+Cj4g
Pj4gSXQgc2VlbXMgdGhlICJhbGwtb3Itbm90aGluZyIgYXBwcm9hY2ggaXMgc3BlY2lmaWMgdG8g
dGhlIGxhenlmcmVlIHVzZQo+ID4+IGNhc2UsIHdoaWNoIG5lZWRzIHRvIHVubWFwIHRoZSBlbnRp
cmUgZm9saW8gZm9yIHJlY2xhbWF0aW9uLiBJZiB0aGF0J3MKPiA+PiBub3QgcG9zc2libGUsIGl0
IGZhbGxzIGJhY2sgdG8gdGhlIHNpbmdsZS1wYWdlIHNsb3cgcGF0aC4KPiA+Cj4gPiBPdGhlciBj
YXNlcyBhZHZhbmNlIHRoZSBQVEUgdGhlbXNlbHZlcywgd2hpbGUgdHJ5X3RvX3VubWFwX29uZSgp
IHJlbGllcwo+ID4gb24gcGFnZV92bWFfbWFwcGVkX3dhbGsoKSB0byBhZHZhbmNlIHRoZSBQVEUu
IFVubGVzcyB3ZSB3YW50IHRvIG1hbnVhbGx5Cj4gPiBtb2RpZnkgcHZtdy5wdGUgYW5kIHB2bXcu
YWRkcmVzcyBvdXRzaWRlIG9mIHBhZ2Vfdm1hX21hcHBlZF93YWxrKCksIHdoaWNoCj4gPiB0byBt
ZSBzZWVtcyBsaWtlIGEgdmlvbGF0aW9uIG9mIGxheWVycy4gOi0pCj4KPiBQbGVhc2UgZXhwbGFp
biB0byBtZSB3aHkgdGhlIGZvbGxvd2luZyBpcyBub3QgY2xlYXJlciBhbmQgYmV0dGVyOgoKVGhp
cyBwYXJ0IGlzIG11Y2ggY2xlYXJlciwgYnV0IHRoYXQgZG9lc27igJl0IG5lY2Vzc2FyaWx5IGlt
cHJvdmUgdGhlIG92ZXJhbGwKcGljdHVyZS4gVGhlIG1haW4gY2hhbGxlbmdlIGlzIGhvdyB0byBl
eGl0IHRoZSBpdGVyYXRpb24gb2YKd2hpbGUgKHBhZ2Vfdm1hX21hcHBlZF93YWxrKCZwdm13KSku
CgpSaWdodCBub3csIHdlIGhhdmUgaXQgbGFpZCBvdXQgcXVpdGUgc3RyYWlnaHRmb3J3YXJkbHk6
CiAgICAgICAgICAgICAgICAvKiBXZSBoYXZlIGFscmVhZHkgYmF0Y2hlZCB0aGUgZW50aXJlIGZv
bGlvICovCiAgICAgICAgICAgICAgICBpZiAobnJfcGFnZXMgPiAxKQogICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIHdhbGtfZG9uZTsKCndpdGggYW55IG5yIGJldHdlZW4gMSBhbmQgZm9saW9f
bnJfcGFnZXMoKSwgd2UgaGF2ZSB0byBjb25zaWRlciB0d28gaXNzdWVzOgoxLiBIb3cgdG8gc2tp
cCBQVEUgY2hlY2tzIGluc2lkZSBwYWdlX3ZtYV9tYXBwZWRfd2FsayBmb3IgZW50cmllcyB0aGF0
CndlcmUgYWxyZWFkeSBoYW5kbGVkIGluIHRoZSBwcmV2aW91cyBiYXRjaDsKMi4gSG93IHRvIGJy
ZWFrIHRoZSBpdGVyYXRpb24gd2hlbiB0aGlzIGJhdGNoIGhhcyBhcnJpdmVkIGF0IHRoZSBlbmQu
CgpPZiBjb3Vyc2UsIHdlIGNvdWxkIGF2b2lkIGJvdGgsIGJ1dCB0aGF0IHdvdWxkIG1lYW4gcGVy
Zm9ybWluZyB1bm5lY2Vzc2FyeQpjaGVja3MgaW5zaWRlIHBhZ2Vfdm1hX21hcHBlZF93YWxrKCku
CgpXZeKAmWxsIHN0aWxsIG5lZWQgdG8gaW50cm9kdWNlIHNvbWUg4oCcY29tcGxpY2F0ZWTigJ0g
Y29kZSB0byBhZGRyZXNzIHRoZSBpc3N1ZXMKbWVudGlvbmVkIGFib3ZlLCB3b27igJl0IHdlPwoK
Pgo+IGRpZmYgLS1naXQgYS9tbS9ybWFwLmMgYi9tbS9ybWFwLmMKPiBpbmRleCA4MjAwZDcwNWZl
NGFjLi4wOWUyYzJmMjhhYTU4IDEwMDY0NAo+IC0tLSBhL21tL3JtYXAuYwo+ICsrKyBiL21tL3Jt
YXAuYwo+IEBAIC0xODQ1LDIzICsxODQ1LDMxIEBAIHZvaWQgZm9saW9fcmVtb3ZlX3JtYXBfcHVk
KHN0cnVjdCBmb2xpbyAqZm9saW8sIHN0cnVjdCBwYWdlICpwYWdlLAo+ICAgI2VuZGlmCj4gICB9
Cj4KPiAtLyogV2Ugc3VwcG9ydCBiYXRjaCB1bm1hcHBpbmcgb2YgUFRFcyBmb3IgbGF6eWZyZWUg
bGFyZ2UgZm9saW9zICovCj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBjYW5fYmF0Y2hfdW5tYXBfZm9s
aW9fcHRlcyh1bnNpZ25lZCBsb25nIGFkZHIsCj4gLSAgICAgICAgICAgICAgICAgICAgICAgc3Ry
dWN0IGZvbGlvICpmb2xpbywgcHRlX3QgKnB0ZXApCj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQg
aW50IGZvbGlvX3VubWFwX3B0ZV9iYXRjaChzdHJ1Y3QgZm9saW8gKmZvbGlvLAo+ICsgICAgICAg
ICAgICAgICBzdHJ1Y3QgcGFnZV92bWFfbWFwcGVkX3dhbGsgKnB2bXcsIGVudW0gdHR1X2ZsYWdz
IGZsYWdzLAo+ICsgICAgICAgICAgICAgICBwdGVfdCBwdGUpCj4gICB7Cj4gICAgICAgICAgY29u
c3QgZnBiX3QgZnBiX2ZsYWdzID0gRlBCX0lHTk9SRV9ESVJUWSB8IEZQQl9JR05PUkVfU09GVF9E
SVJUWTsKPiAtICAgICAgIGludCBtYXhfbnIgPSBmb2xpb19ucl9wYWdlcyhmb2xpbyk7Cj4gLSAg
ICAgICBwdGVfdCBwdGUgPSBwdGVwX2dldChwdGVwKTsKPiArICAgICAgIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hID0gcHZtdy0+dm1hOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBlbmRfYWRk
ciwgYWRkciA9IHB2bXctPmFkZHJlc3M7Cj4gKyAgICAgICB1bnNpZ25lZCBpbnQgbWF4X25yOwo+
ICsKPiArICAgICAgIGlmIChmbGFncyAmIFRUVV9IV1BPSVNPTikKPiArICAgICAgICAgICAgICAg
cmV0dXJuIDE7Cj4gKyAgICAgICBpZiAoIWZvbGlvX3Rlc3RfbGFyZ2UoZm9saW8pKQo+ICsgICAg
ICAgICAgICAgICByZXR1cm4gMTsKPiArCj4gKyAgICAgICAvKiBXZSBtYXkgb25seSBiYXRjaCB3
aXRoaW4gYSBzaW5nbGUgVk1BIGFuZCBhIHNpbmdsZSBwYWdlIHRhYmxlLiAqLwo+ICsgICAgICAg
ZW5kX2FkZHIgPSBtaW5fdCh1bnNpZ25lZCBsb25nLCBBTElHTihhZGRyICsgMSwgUE1EX1NJWkUp
LCB2bWEtPnZtX2VuZCk7Cj4gKyAgICAgICBtYXhfbnIgPSAoZW5kX2FkZHIgLSBhZGRyKSA+PiBQ
QUdFX1NISUZUOwo+Cj4gKyAgICAgICAvKiBXZSBvbmx5IHN1cHBvcnQgbGF6eWZyZWUgYmF0Y2hp
bmcgZm9yIG5vdyAuLi4gKi8KPiAgICAgICAgICBpZiAoIWZvbGlvX3Rlc3RfYW5vbihmb2xpbykg
fHwgZm9saW9fdGVzdF9zd2FwYmFja2VkKGZvbGlvKSkKPiAtICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOwo+ICsgICAgICAgICAgICAgICByZXR1cm4gMTsKPiAgICAgICAgICBpZiAocHRlX3Vu
dXNlZChwdGUpKQo+IC0gICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gLSAgICAgICBpZiAo
cHRlX3BmbihwdGUpICE9IGZvbGlvX3Bmbihmb2xpbykpCj4gLSAgICAgICAgICAgICAgIHJldHVy
biBmYWxzZTsKPiAtCj4gLSAgICAgICByZXR1cm4gZm9saW9fcHRlX2JhdGNoKGZvbGlvLCBhZGRy
LCBwdGVwLCBwdGUsIG1heF9uciwgZnBiX2ZsYWdzLCBOVUxMLAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBOVUxMLCBOVUxMKSA9PSBtYXhfbnI7Cj4gKyAgICAgICAgICAgICAgIHJl
dHVybiAxOwo+ICsgICAgICAgcmV0dXJuIGZvbGlvX3B0ZV9iYXRjaChmb2xpbywgYWRkciwgcHZt
dy0+cHRlLCBwdGUsIG1heF9uciwgZnBiX2ZsYWdzLAo+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBOVUxMLCBOVUxMLCBOVUxMKTsKPiAgIH0KPgo+ICAgLyoKPiBAQCAtMjAyNCw5ICsy
MDMyLDcgQEAgc3RhdGljIGJvb2wgdHJ5X3RvX3VubWFwX29uZShzdHJ1Y3QgZm9saW8gKmZvbGlv
LCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKHB0ZV9kaXJ0eShwdGV2YWwpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGZvbGlvX21hcmtfZGlydHkoZm9saW8pOwo+ICAgICAgICAgICAgICAgICAgfSBlbHNlIGlmIChs
aWtlbHkocHRlX3ByZXNlbnQocHRldmFsKSkpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoZm9saW9fdGVzdF9sYXJnZShmb2xpbykgJiYgIShmbGFncyAmIFRUVV9IV1BPSVNPTikgJiYK
PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgY2FuX2JhdGNoX3VubWFwX2ZvbGlvX3B0ZXMo
YWRkcmVzcywgZm9saW8sIHB2bXcucHRlKSkKPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIG5yX3BhZ2VzID0gZm9saW9fbnJfcGFnZXMoZm9saW8pOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIG5yX3BhZ2VzID0gZm9saW9fdW5tYXBfcHRlX2JhdGNoKGZvbGlvLCAmcHZtdywgZmxh
Z3MsIHB0ZXZhbCk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgIGVuZF9hZGRyID0gYWRkcmVz
cyArIG5yX3BhZ2VzICogUEFHRV9TSVpFOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICBmbHVz
aF9jYWNoZV9yYW5nZSh2bWEsIGFkZHJlc3MsIGVuZF9hZGRyKTsKPgo+Cj4gLS0KPiBDaGVlcnMs
Cj4KPiBEYXZpZCAvIGRoaWxkZW5iCj4KClRoYW5rcwpCYXJyeQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
