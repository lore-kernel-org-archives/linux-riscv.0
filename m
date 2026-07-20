Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC2CC44515
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 14:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MG5OzQM47NFJwEoC4ayop/rxEJPYW8rCbuHf2UXxenM=; b=xDvt05NSVEFlpn
	en5kVa2X7Z0msVRNM5ul3rso2cB5ICTmurZwxjJAteZrTHx2ox3F0J2yQ9rMEMEivND6QHXWHDANu
	D57RjClOtKaB3DL3AJ4heCVR6vA7JyTFu+pYdQ7ocHslY4PnDkMfAmPog3TrxPQ1X+8QxlFfXCQSR
	0l7RkbULqBjGpchCRpjwmLmBIUCqxkH1J3I05YqqKh5YQ/qcX6GVjlDJH0MoN6H7jnQUxumDJDzGy
	mLkFg9/+QEO8imuAe2z6Q3KSc314o95UeFNhCrmph3ac1vXC0pO82+vtXDXcFIGBgfnjdDzyZN/lF
	URWmrRJosy95+fge24bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlovL-00000006xLF-4AvX;
	Mon, 20 Jul 2026 14:24:52 +0000
Received: from mail-wm2-x0a.google.com ([2a00:1450:4864:31::a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlovJ-00000006xKm-1JvE
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 14:24:50 +0000
Received: by mail-wm2-x0a.google.com with SMTP id 5b1f17b1804b1-495501e57beso6703165e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 07:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784557486; x=1785162286; darn=lists.infradead.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WY4da/eZLxxQmiBbPjg8+Of4x2fEz1afwkY5i+KDZGo=;
        b=claPF2Wgt4DEPQnNih5Yka9/+KMGr7jTr5G0zmw+Y9PNoS8mOO9+SPFN9XSeUjIVxH
         DI9lcFSZuyam6BdmsyaFiDIrW45cJdmlYUTlAj6QawgBveFJpDtaC6HqNvd6xFILg3sK
         azzfvT01uTJs7ca70pCyNQpvF4636kIZFKXulp+n1ha/V2QktVAOasQ6y0p2Khke1fhY
         Jlgle1PsgS33mUzsf9QeWCLj6YDoJkkZV2N3iIar/TzNPRS80INcuTjV5dLzB4gLbsRQ
         Q7F19Xiy9PPIFZgkWIZFwKGwwc9Ey+zV5XmHO/htEG6Jev3rfO42t/lXUzt1JDOlSe+h
         T54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784557486; x=1785162286;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WY4da/eZLxxQmiBbPjg8+Of4x2fEz1afwkY5i+KDZGo=;
        b=mj8O8J55GcJiyIKkG6Je08CduitsdRqiovGvhqSY5MfNCh/LhkPVKiFEosPTwrvvxt
         eWAa4eRaZd9uMr2KPL+penXWmlR6F8dvjls4fGP8hUg4NTQk0udJLHANy/tr8hnE31DX
         oC4Ouv6cWIkiQNIq/i1f6LUL0KqRIIHXncYYgAYythwcpVi58StvcuqGzkwi8oA/aAsc
         BBIyKCNJQPtix3hyXByE9SfrKldCgDrygeUiBewnubTrsby8hLUaJHCsDEobm/IKcdZl
         2jEBfucfiRzo92DljESvANDrRIL0HKZSi3uCXhzE0D/I35sxhsCCPdplTnOTPFiku3i3
         etdQ==
X-Forwarded-Encrypted: i=1; AHgh+Roa/Hszp6lvUDpCUpj4cF5d1t2/Un4kG1ZXR5O+wdE2JqMfVl42+qaawX29T4hST6E+iYv6vIw9V5qf7A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzn2xN/UR9zJCkQlAN24by9ErKTWk/zwz1OknBVKqMD7bn/vF/j
	f7djqla/Nowjjo00hpfYHScAGREgBliz+wZoYY8Ijp0Kw1ElNT3W0JOo
X-Gm-Gg: AfdE7cnq+XNiIJleKq0+8xn5Y0BlKv0NH+V2VeeyBK73SUCFZyZfydisCHUihb3vBR7
	lFZkLukYWMF+6z4Bv7TblLW/HbjxshowhZkwT9dthZt415pGQsbhYEkK6b/JYpnZONmfq7QUpAs
	xtYFp1ivS/AHfGH14vkEB/V/i13HTP7ePOTThUxF1WHKzfncLSC1SJKhMDGxXycYssjcjciO6AX
	y5jJM7p3MIlWHv3T048mR47rQ5PIvmAYHxGmIQHXK1WbofubLNw9D+qQQvS54OTEOwZxbQ17fbZ
	0ZHIgz5HXB9ydeo3gWK0HyOI1nCwiPTtQM3jzbRnZpSW65qzQxjxW3PejH1MhLP8XNGxuAle89Q
	ViCQfe+6xZBfhhFEU70mCm60sHU3+V+nJFly/e/FDCJ5Ha/Uxce2KqZHTXilG0nd3spXmlITz1M
	07RvZW36P8bxzLjoCldkNDnjUMTu7GOh3U9nKs0JVovticAP3N9GCQejjFy9Y4hBy0J1jL3PJn8
	nTu3xrf1HiZjoo85XnW7MpG5J2TeQIjKfrzjqD5xIsNTLLDrnqd5mo=
X-Received: by 2002:a05:600c:ad7:b0:495:3c6d:f294 with SMTP id 5b1f17b1804b1-4954a402da3mr118155185e9.23.1784557485673;
        Mon, 20 Jul 2026 07:24:45 -0700 (PDT)
Received: from localhost (nat-icclus-192-26-29-3.epfl.ch. [192.26.29.3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f67466e09sm32026063f8f.21.2026.07.20.07.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:24:44 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 20 Jul 2026 16:24:44 +0200
Message-Id: <DK3GTYQ5UOMO.CVL471XPD0AT@gmail.com>
Cc: "Daniel Borkmann" <daniel@iogearbox.net>, <bot+bpf-ci@kernel.org>,
 <bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <ast@kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <martin.lau@linux.dev>, <song@kernel.org>,
 <yonghong.song@linux.dev>, <john.fastabend@gmail.com>,
 <kpsingh@kernel.org>, <sdf@fomichev.me>, <haoluo@google.com>,
 <jolsa@kernel.org>, <puranjay@kernel.org>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <alex@ghiti.fr>, <pulehui@huawei.com>,
 <martin.lau@kernel.org>, <clm@meta.com>, <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v6 6/7] riscv, bpf: Mixing bpf2bpf and
 tailcalls
From: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>
To: "Pu Lehui" <pulehui@huaweicloud.com>, =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?=
 <bjorn@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260708064436.2971933-7-pulehui@huaweicloud.com>
 <a721df30ec2f824295000183c8e91f2c19d0bd56ae115b835b402be9eacc1c71@mail.kernel.org> <b4aadfde-9745-4c71-8dd4-ce433331f91b@huaweicloud.com> <CAJ+HfNi_icVbeB=jw-xnXrwzigZwP2OVRbzaF3VC87i6fDpdDw@mail.gmail.com> <fc972c33-1b66-4979-97e9-71627fb6179f@huaweicloud.com> <CAJ+HfNgPWwX3dfu=62TSMKeLD8m9S0rc2k9G8rVN7r2SuzQ6MQ@mail.gmail.com> <23cb9eac-1775-44b8-a9ec-10edde808a30@huaweicloud.com> <326eda4a-39e6-4f1e-8fe5-dc1cc9ae6739@iogearbox.net> <dd20e3ea-4b3a-45d1-99f4-79e99e51e7fb@huaweicloud.com>
In-Reply-To: <dd20e3ea-4b3a-45d1-99f4-79e99e51e7fb@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_072449_404279_15B3DED7 
X-CRM114-Status: GOOD (  18.18  )
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

T24gRnJpIEp1bCAxNywgMjAyNiBhdCA5OjM3IEFNIENFU1QsIFB1IExlaHVpIHdyb3RlOgo+Cj4K
PiBPbiAyMDI2LzcvMTAgMTc6NDMsIERhbmllbCBCb3JrbWFubiB3cm90ZToKPj4gT24gNy8xMC8y
NiAyOjUzIEFNLCBQdSBMZWh1aSB3cm90ZToKPj4+IE9uIDIwMjYvNy8xMCAzOjUxLCBCasO2cm4g
VMO2cGVsIHdyb3RlOgo+Pj4+IE9uIFRodSwgOSBKdWwgMjAyNiBhdCAxNzowOSwgUHUgTGVodWkg
PHB1bGVodWlAaHVhd2VpY2xvdWQuY29tPiB3cm90ZToKPj4+Pj4gT24gMjAyNi83LzkgMTk6Mzcs
IEJqw7ZybiBUw7ZwZWwgd3JvdGU6Cj4+Pj4+PiBTb3JyeSBmb3IgdGhlIGRlbGF5IGhlcmUgLS0g
dGhlIGJvdCBoYWQgbWUgdGhpbmtpbmcgYSBiaXQuCj4+Pj4+Pgo+Pj4+Pj4gT24gV2VkLCA4IEp1
bCAyMDI2IGF0IDEwOjU0LCBQdSBMZWh1aSA8cHVsZWh1aUBodWF3ZWljbG91ZC5jb20+IHdyb3Rl
Ogo+Pj4+Pj4gLi4uCj4+Pj4+Pgo+Pj4+Pj4+PiBUaGlzIGFzc3VtZXMgYSBmaXhlZCBudW1iZXIg
b2YgaW5zdHJ1Y3Rpb25zIGJlZm9yZSB0aGUgdGFpbGNhbGwKPj4+Pj4+Pj4gZW50cnkKPj4+Pj4+
Pj4gcG9pbnQuIFdoZW4gaXNfc3VicHJvZyBpcyB0cnVlLCB0aGUgcnZfYWRkaSgpIGluc3RydWN0
aW9uIGlzIG5vdAo+Pj4+Pj4+PiBlbWl0dGVkLAo+Pj4+Pj4+PiB3aGljaCBtZWFucyB0aGUgdGFp
bGNhbGwgZW50cnkgcG9pbnQgbW92ZXMgZm9yd2FyZCBieSA0IGJ5dGVzCj4+Pj4+Pj4+IHJlbGF0
aXZlIHRvCj4+Pj4+Pj4+IHdoZXJlIFJWX1RBSUxDQUxMX09GRlNFVCBleHBlY3RzIGl0IHRvIGJl
Lgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBUaGUgdGFpbGNhbGwgZW50cnkgaXMgdXNlZCBpbiBlbWl0X2Jw
Zl90YWlsX2NhbGwoKSB3aGVuCj4+Pj4+Pj4+IGNhbGN1bGF0aW5nIHRoZQo+Pj4+Pj4+PiBqdW1w
IHRhcmdldCBmb3IgdGhlIHRhaWwgY2FsbC4gSWYgUlZfVEFJTENBTExfT0ZGU0VUIGRvZXNuJ3QK
Pj4+Pj4+Pj4gYWNjb3VudCBmb3IKPj4+Pj4+Pj4gdGhlIGNvbmRpdGlvbmFsIGVtaXNzaW9uLCBj
b3VsZCB0aGlzIGNhdXNlIHRoZSB3cm9uZyBlbnRyeSBwb2ludAo+Pj4+Pj4+PiB0byBiZQo+Pj4+
Pj4+PiB1c2VkIHdoZW4gdGFpbCBjYWxsaW5nIGludG8gc3VicHJvZ3JhbXM/Cj4+Pj4+Pj4KPj4+
Pj4+PiBUaGlzIGlzIG5vdCBhbiBpc3N1ZSwgc3VicHJvZyBjYW4gbm90IGJlIHRoZSB0YWlsY2Fs
bCBjYWxsZWUuCj4+Pj4+Pgo+Pj4+Pj4gU2F5LCB0aGF0IHdlIGhhdmUgYW4gZW50cnkgZnVuY3Rp
b24gdGhhdCBkb2VzIGJwZl9mb3JfZWFjaF9tYXBfYXJyYXkoKQo+Pj4+Pj4gaW50byBhIGNhbGxi
YWNrIGNiKCkuIGNiKCkgaXMgYSBzdWJwcm9ncmFtLCBzbyBubyBpbml0IG9mIFRDQy4gTm93LAo+
Pj4+Pj4gY2IoKSBjYWxscyBhbm90aGVyIHN1YnByb2dyYW0gdGhhdCBkb2VzIGEgdGFpbGNhbGwu
Cj4+Pj4+Pgo+Pj4+Pj4gVGhlIGNhbGxiYWNrIHRvIGNiKCkgaXMgY29taW5nIGZyb20gdGhlIGtl
cm5lbCwgc28gYTYgY291bGQgaGF2ZSBiZWVuCj4+Pj4+PiBjbG9iYmVyZWQsIG5vPyBXZSdyZSBl
bnRlcmluZyBhIHN1YnByb2dyYW0gY29taW5nIGZyb20gdGhlIEMgQUJJLiBOb3csCj4+Pj4+PiBp
ZiB0aGUgY2FsbGJhY2sgY2FsbHMgYSBzdWJwcm9nIHRoYXQncyB0YWlsLWNhbGwgcmVhY2hhYmxl
LCB0aGUgVENDCj4+Pj4+PiBjYW4gYmUgZ2FyYmFnZT8KPj4+Pj4KPj4+Pj4gU2FzaGlrbyByZXBv
cnRlZCB0aGUgc2FtZSBpc3N1ZSB5ZXN0ZXJkYXkuIEkgdmVyaWZpZWQgdGhhdCB0aGUgdmVyaWZp
ZXIKPj4+Pj4gcmVqZWN0cyBjYXNlcyB3aGVyZSBhIHRhaWwgY2FsbCBpcyBpbnZva2VkIHdpdGhp
biBhIGNhbGxiYWNrOwo+Pj4+PiBzcGVjaWZpY2FsbHksIHdoaWxlIHRoZSBjYWxsYmFjaydzIHJl
dHVybiB2YWx1ZSByYW5nZSBpcyBbMCwgMV0sIHRoZQo+Pj4+PiBzaW11bGF0aW9uIG9mIHRoZSBl
eGl0IHBhdGggaW4gYGNoZWNrX2hlbHBlcl9jYWxsYCAoaGFuZGxpbmcgdGhlIHRhaWwKPj4+Pj4g
Y2FsbCBoZWxwZXIpIG1hcmtzIFIwIGFzIFVOS05PV04sIGNhdXNpbmcgdGhlIHZlcmlmaWVyIHRv
IHJlamVjdAo+Pj4+PiBpdOKAlHNvIEkKPj4+Pj4gZGlkbid0IGludmVzdGlnYXRlIGZ1cnRoZXIu
IEhvd2V2ZXIsIEkganVzdCB2ZXJpZmllZCB0aGF0IHRoZSB2ZXJpZmllcgo+Pj4+PiAqZG9lcyog
YWNjZXB0IHRoZSBzY2VuYXJpbyB3aGVyZSBhIGNhbGxiYWNrIGNhbGxzIGEgc3VicHJvZ3JhbSwg
YW5kCj4+Pj4+IHRoYXQKPj4+Pj4gc3VicHJvZ3JhbSBzdWJzZXF1ZW50bHkgY2FsbHMgYSB0YWls
IGNhbGwuIEkgYmVsaWV2ZSB0aGlzIHNjZW5hcmlvCj4+Pj4+IG91Z2h0Cj4+Pj4+IHRvIGJlIHJl
amVjdGVkOyBwZXJoYXBzIHNvbWUgY2hhbmdlcyBhcmUgbmVlZGVkIGluIHRoZSB2ZXJpZmllciwK
Pj4+Pj4gb3RoZXJ3aXNlIHRhaWwgY2FsbHMgb24gb3RoZXIgYXJjaGl0ZWN0dXJlcyAobGlrZSB4
ODYpIHdvdWxkIGFsc28gYmUKPj4+Pj4gc3VzY2VwdGlibGUgdG8gaW5maW5pdGUgbG9vcCBpc3N1
ZXMuCj4+Pj4KPj4+PiBUaGFua3MgZm9yIHRyeWluZyBpdCBvdXQhCj4+Pj4KPj4+PiBPaywgc28g
c2VlbXMgbGlrZSB3ZSBuZWVkIGEgdmVyaWZpZXIgZml4IHByZS1sYW5kaW5nPwo+Cj4gSGkgQmrD
tnJuLAo+Cj4gSnVzdCBhIHF1aWNrIG5vdGUgdGhhdCB0aGUgdmVyaWZpZXIgZml4IHdlIGRpc2N1
c3NlZCBoYXMgbm93IGxhbmRlZCBpbgo+IGJwZi1uZXh0IFswXS4gTG9va2luZyBmb3J3YXJkIHRv
IHlvdXIgZmVlZGJhY2sgb24gdjYgd2hlbmV2ZXIgeW91IGdldCBhCj4gY2hhbmNlLiA6KQoKWWVw
LCBpZiB0aGVyZSBhcmUgbm8gbW9yZSBjb25jZXJucywgaXQgd291bGQgbWFrZSBzZW5zZSB0byBw
dWxsIHRoaXMgaW4uCgpCasO2cm4sIHdoYXQgZG8geW91IHRoaW5rPwoKPiBbLi4uXQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
