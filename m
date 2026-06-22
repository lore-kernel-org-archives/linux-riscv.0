Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D38CDB466
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 00:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xvK2rsAzoXlV/4tgX/2FypiXj/UjtCFf9N6Mi5M56n0=; b=xnQliWQp5HBXtG
	Fq5OK9xfERctoBNkiudGLdengvbM2y2TzDb+s9mcSx0vPsUj2QK0of8QXW2Nu2+IViDhSOkeRSMTb
	G9lSGz8RTsEau6DagI36GjsssepYcSDXcGVOQUsFCFSk17ogzOzm5bOi2993hTDwgUyiLHeScy0Pb
	6rXY/gshMtqjgDnn6qDC5MmmWnQCGbprDlczwhbqfJLNZlpnEGNp2TT5He8d0lalxzTUmtD72la/u
	j6cUqDWJ0gAkLXvj3/KYeH7UTma5v26Ccv726FE2lmwS74Ohq2Ldm/ygdYrSvTJGKABs4xRSNgN/4
	rYEHe2bBwOkYuwkjRqfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbSKg-00000004FFa-0j0c;
	Mon, 22 Jun 2026 00:16:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbSKf-00000004FFI-0QBC
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 00:16:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 02229601EE
	for <linux-riscv@lists.infradead.org>; Mon, 22 Jun 2026 00:16:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8791F00ADE
	for <linux-riscv@lists.infradead.org>; Mon, 22 Jun 2026 00:16:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782087367;
	bh=IHIwIiKiSPJeb13YpcTgfxJcsK09+PRa0/JU1j/CnWg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cMLhsAttTe8dyYAVQ5ButgRPTCNVZUjJ+rFUJS/Nb+BEGqhTUydcs0LU3Lix/Z3ek
	 KD0MCI/yAPBWlN6wb7sqDiwlAttozmfCiUFWz9O3jE4hYXuyhq8p1QaOAF9Rxm+bPp
	 zboU9r+goMAm9xbYv8LFtKEEZ5j6ZLteAPSQZ6OcSh5MIs/62zPpZIj5oiIaFmvUDR
	 QC6ZRHtySEUkXZIEInSyph82+HpL4LpnJ7gqwRc/Aciq0eNZH9YLMUThL9XzXyeqjI
	 Rm0VjsR1+yxuogHe+HIFTcJ5KRUzQnReJU7/nUzkEoFcP0eQK2LX+MLHdOMaRBfjL5
	 BYH2jN1C6LQGQ==
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-517654b8e28so32782251cf.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jun 2026 17:16:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ReR57dR7+ShpCtCNuiIhhkOZmPH5fAFTtEntpy01rA+Qr7S/s/Tgx97mBhWlRzEdTzZXPdcvjaMReUg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJTvZlI8NLsjpXU2yj6gNUWKnfrlzNCmaFBTh8n/K+xBoey0JQ
	479RIQiq7W2jtOpqvS89Z5rT1OeA/d5PCtg7FvAzoUfeCmpwst6H88OW/vw2DikdrZn195zk/+F
	1vc2SJczjbCmwmxM2SpViH5GvzQmKjr4=
X-Received: by 2002:a05:620a:2991:b0:920:bc4a:6d9f with SMTP id
 af79cd13be357-921d185ff31mr1291391485a.25.1782087366553; Sun, 21 Jun 2026
 17:16:06 -0700 (PDT)
MIME-Version: 1.0
References: <5zdaa5uv5oj27q3taopl3amops57ouxgyfsdveudz4ovmbdw7z@6lwrlyvmhcp2>
 <CAGsJ_4yKxg1QugcsJi3WD0KVGJKe-zXycgm5D6cRi9vWtNcpDQ@mail.gmail.com>
 <ag4h87CBd-gph9zX@casper.infradead.org> <CAGsJ_4zA8afu0xXy0WS+tMe-eesDX1W6UBmfAsuouUpcAgK8JQ@mail.gmail.com>
 <ag4kj84EcKqamdB-@casper.infradead.org> <3be9475b-0e8a-4df8-a130-4262f993973d@kernel.org>
 <CAGsJ_4xC5LdhuoWV1=tK-RZ5rkjc8aOKOkmb1L_8BG_3gtJhDg@mail.gmail.com>
 <ahB6QyHgYq8ksj65@lucifer> <CAGsJ_4zxLvZ01i19vdo0xA47T1hxa1VRYvxLmiDhy5q1GDKPRg@mail.gmail.com>
 <CAJuCfpHTxaU4KdNmefU7C7cWZSLCFDLPdUrnqV6yzxzN+8RQ0Q@mail.gmail.com> <ajhOUdbWsswgQyl2@casper.infradead.org>
In-Reply-To: <ajhOUdbWsswgQyl2@casper.infradead.org>
From: Barry Song <baohua@kernel.org>
Date: Mon, 22 Jun 2026 08:15:55 +0800
X-Gmail-Original-Message-ID: <CAGsJ_4ybg5LGYopTUJTh5R2rN6X3uR9xoJSL+RdTYVtm1-xqLg@mail.gmail.com>
X-Gm-Features: AVVi8CfKzSAPaNgcIJCxOHQBAHV_wanqXUmTigM-8i98Bk0ci-4XCgmSQNzZol4
Message-ID: <CAGsJ_4ybg5LGYopTUJTh5R2rN6X3uR9xoJSL+RdTYVtm1-xqLg@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mm: reduce mmap_lock contention and improve page
 fault performance
To: Matthew Wilcox <willy@infradead.org>
Cc: Suren Baghdasaryan <surenb@google.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, akpm@linux-foundation.org, 
	linux-mm@kvack.org, vbabka@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	jack@suse.cz, pfalcato@suse.de, wanglian@kylinos.cn, chentao@kylinos.cn, 
	lianux.mm@gmail.com, kunwu.chan@gmail.com, liyangouwen1@oppo.com, 
	chrisl@kernel.org, kasong@tencent.com, shikemeng@huaweicloud.com, 
	nphamcs@gmail.com, bhe@redhat.com, youngjun.park@lge.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Nanzhe Zhao <nzzhao@126.com>
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

T24gTW9uLCBKdW4gMjIsIDIwMjYgYXQgNDo0OeKAr0FNIE1hdHRoZXcgV2lsY294IDx3aWxseUBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPgo+IE9uIFNhdCwgSnVuIDIwLCAyMDI2IGF0IDA0OjQ4OjU3
UE0gLTA3MDAsIFN1cmVuIEJhZ2hkYXNhcnlhbiB3cm90ZToKPiA+IEp1c3QgY2hlY2tpbmcgaW4g
b24gdGhlIGZvbGxvd3VwIHBsYW5zLiBJSVVDIHRoZSBSRkMgbWVudGlvbmVkIHdpbGwKPiA+IHRy
eSB0byBpbXBsZW1lbnQgdGhlIHNvbHV0aW9uIHdlIGRpc2N1c3NlZCBhdCBMU0ZNTTogc3BsaXR0
aW5nCj4gPiBWTV9GQVVMVF9SRVRSWSBpbnRvIHR3byBmbGFncyAtIG9uZSBmb3IgcmV0cnlpbmcg
dW5kZXIgcGVyLVZNQSBsb2Nrcwo+ID4gYW5kIGFub3RoZXIgb25lIHRvIGZhbGxiYWNrIHRvIG1t
YXBfbG9jay4KPgo+IEkgY29udGludWUgdG8gaGF0ZSB0aGlzIGlkZWEuICBJIGRvbid0IGJlbGll
dmUgdGhhdCB0aG9zZSB3aG8gd2VyZQo+IHB1c2hpbmcgZm9yIGl0IGhhdmUgZXZlciB0cmllZCB0
byB1bmRlcnN0YW5kIHRoZSB3aG9sZSBmYXVsdCBwYXRoLgo+IEl0J3MgdXR0ZXJseSBieXphbnRp
bmUuCj4KPiBJIGRlZnkgYW55b25lIHRvIG1ha2Ugc2Vuc2Ugb2YgdGhpczoKPgo+ICAgICAgICAg
LyoKPiAgICAgICAgICAqIE5PVEUhIFRoaXMgd2lsbCBtYWtlIHVzIHJldHVybiB3aXRoIFZNX0ZB
VUxUX1JFVFJZLCBidXQgd2l0aAo+ICAgICAgICAgICogdGhlIGZhdWx0IGxvY2sgc3RpbGwgaGVs
ZC4gVGhhdCdzIGhvdyBGQVVMVF9GTEFHX1JFVFJZX05PV0FJVAo+ICAgICAgICAgICogaXMgc3Vw
cG9zZWQgdG8gd29yay4gV2UgaGF2ZSB3YXkgdG9vIG1hbnkgc3BlY2lhbCBjYXNlcy4uCj4gICAg
ICAgICAgKi8KPiAgICAgICAgIGlmICh2bWYtPmZsYWdzICYgRkFVTFRfRkxBR19SRVRSWV9OT1dB
SVQpCj4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+Cj4gICAgICAgICAqZnBpbiA9IG1heWJl
X3VubG9ja19tbWFwX2Zvcl9pbyh2bWYsICpmcGluKTsKPiAgICAgICAgIGlmICh2bWYtPmZsYWdz
ICYgRkFVTFRfRkxBR19LSUxMQUJMRSkgewo+ICAgICAgICAgICAgICAgICBpZiAoX19mb2xpb19s
b2NrX2tpbGxhYmxlKGZvbGlvKSkgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qCj4gICAg
ICAgICAgICAgICAgICAgICAgICAgICogV2UgZGlkbid0IGhhdmUgdGhlIHJpZ2h0IGZsYWdzIHRv
IGRyb3AgdGhlCj4gICAgICAgICAgICAgICAgICAgICAgICAgICogZmF1bHQgbG9jaywgYnV0IGFs
bCBmYXVsdF9oYW5kbGVycyBvbmx5IGNoZWNrCj4gICAgICAgICAgICAgICAgICAgICAgICAgICog
Zm9yIGZhdGFsIHNpZ25hbHMgaWYgd2UgcmV0dXJuIFZNX0ZBVUxUX1JFVFJZLAo+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAqIHNvIHdlIG5lZWQgdG8gZHJvcCB0aGUgZmF1bHQgbG9jayBoZXJl
IGFuZAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAqIHJldHVybiAwIGlmIHdlIGRvbid0IGhh
dmUgYSBmcGluLgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIGlmICgqZnBpbiA9PSBOVUxMKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmVsZWFzZV9mYXVsdF9sb2NrKHZtZik7Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIDA7Cj4gICAgICAgICAgICAgICAgIH0KPgo+IFdlZCBuZWVkIHRvIHNpbXBsaWZ5IHRo
ZSBmYXVsdCBwYXRoLCBub3QgYWRkIGFkZGl0aW9uYWwgY29tcGxleGl0eS4KPiBKb3NlZiBoYXMg
c2FpZCBoZSB3b3VsZG4ndCd2ZSBkb25lIHRoZSBsb2NrIGRyb3BwaW5nIGhhZCB3ZSBoYWQgcGVy
LVZNQQo+IGxvY2tzLiAgV2Ugc2hvdWxkIHJpcCBpdCBvdXQuCgpJIHRoaW5rIHlvdSBoYXZlIGFn
cmVlZCB0aGF0LCBhdCBsZWFzdCBmb3IgYW5vbiB2bWEsIHdlIGNhbgprZWVwIHRoZSBjdXJyZW50
IHBvbGljeSwgc2luY2UgYW5vbiB2bWEgaXMgbXVjaCBtb3JlIHZvbGF0aWxlCnRoYW4gZmlsZSB2
bWEuCkNvbmN1cnJlbnQgcGFnZSBmYXVsdHMgYW5kIFZNQSBtb2RpZmljYXRpb25zIGNhbiBoYXBw
ZW4gbW9yZQpvZnRlbiB0aGFuIHdpdGggZmlsZSBWTUFzLgoKRm9yIGZpbGUgdm1hcywgaG93IG11
Y2ggY29kZSBjYW4gd2UgYWN0dWFsbHkgcmVtb3ZlLCBnaXZlbiB0aGF0CnRoZSBmaXJzdCBwYWdl
IGZhdWx0IG1pZ2h0IGFscmVhZHkgYmUgaG9sZGluZyBtbWFwX2xvY2s/Ckl0IGNvdWxkIGJlIHRo
ZSBjYXNlIHRoYXQgbG9ja192bWFfdW5kZXJfcmN1KCkgZmFpbHMsIGFuZCB0aGVuCm9uIHRoZSBm
aXJzdCBwYWdlIGZhdWx0IHdlIGVuZCB1cCBob2xkaW5nIG1tYXBfbG9jayBiZWZvcmUKcmV0cnlp
bmcuIFNvIGFyZSB3ZSBhbHNvIGdvaW5nIHRvIHJpcCBvdXQgdGhlIGxvY2sgcmVsZWFzZSwKZXZl
biBpZiBpdCByaXNrcyBob2xkaW5nIG1tYXBfbG9jayBmb3IgYSBsb25nIHRpbWU/CgogICAgICAg
IHZtYSA9IGxvY2tfdm1hX3VuZGVyX3JjdShtbSwgYWRkcik7CiAgICAgICAgaWYgKCF2bWEpCiAg
ICAgICAgICAgICAgICBnb3RvIGxvY2tfbW1hcDsKICAgICAgIC4uLgpsb2NrX21tYXA6CgogICAg
ICAgIHZtYSA9IGxvY2tfbW1fYW5kX2ZpbmRfdm1hKG1tLCBhZGRyLCByZWdzKTsKICAgICAgICBp
ZiAodW5saWtlbHkoIXZtYSkpIHsKICAgICAgICAgICAgICAgIGZhdWx0ID0gMDsKICAgICAgICAg
ICAgICAgIHNpX2NvZGUgPSBTRUdWX01BUEVSUjsKICAgICAgICAgICAgICAgIGdvdG8gYmFkX2Fy
ZWE7CiAgICAgICAgfQoKSWYgd2Ugc3RpbGwgbmVlZCB0byBrZWVwIHRoZSBwYWdlIGZhdWx0IHJl
dHJ5IGNvZGUgdGhlcmUsIGl0CmRvZXNuJ3Qgc2VlbSBsaWtlICJyaXBwaW5nIG91dCIgcmVhbGx5
IHJlZHVjZXMgY29tcGxleGl0eSBpbgp0aGUgcGFnZSBmYXVsdCBjb2RlPwoKQmVzdCBSZWdhcmRz
CkJhcnJ5CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
