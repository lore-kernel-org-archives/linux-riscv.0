Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7207CC77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 23:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oJbKBBCPRd8QFrvS94Zsc2fD/z5W+ehtowm0QE4ZQx4=; b=M+vn6JGlHsX8xP
	tfLL9w7txwkLSmR2pg9GyvDZ6o6k7MjXctj8+Freqo3Qg0tdnpe/YOonWTfLgbZ0K2pteth/XxU0S
	e+jNnTkmsWLsNVbkRbetpYrVvXw+yahi7RWRE8i3DeceXulESrg35TkZrtMl0dMEZHGc0dmaAFtln
	Z+qiNJ5VpqSwJtDgETcCdD02nTQw+A9yzwneB+BkRTT+JiLiWP+z+DYVqNQb5C9qv/Uj/u4nFqtBY
	GZcDC2F8RnBRvbKecR+mpZ5PCa4Gm0F0H6DvgHHESAIEgqE8fnhWvy3CTrdsAhCYfPl1NLNz/P0YM
	endH88sImmHNoHMLekIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pq0LT-00C4h9-23;
	Fri, 21 Apr 2023 23:39:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pq0LP-00C4gL-2n
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 23:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682120347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q/afhnI1x+eYKjA0I6qC7en+J2iSi5vz0PAxjsQejjY=;
	b=jC1XooJ25pR0hWFxkAbKeoKgGXF2+WVkrlE3Y++E/cNzfIqspNoT9N5nztj2OgWlIHzE74
	jpG/EHP9N/7znb4TGH1e8FpTZA/V753Mn4ghS34L7D4u4af6rrJs4qzc4Qia+s/RrOLOCI
	hJH4AfD77nHftfylK70aoHzzdyoHY4A=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558-jhcTnteGPjW22FhzP3nRqg-1; Fri, 21 Apr 2023 19:39:06 -0400
X-MC-Unique: jhcTnteGPjW22FhzP3nRqg-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-4407c1d9c9eso654212e0c.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Apr 2023 16:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682120346; x=1684712346;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q/afhnI1x+eYKjA0I6qC7en+J2iSi5vz0PAxjsQejjY=;
        b=MX/+td1ZQHSJ9/+ry/EQ2r9TREhC/ucMrrbkiCH/DLSP6AoF0YuubZ/lzcYru0bLy8
         8W6IUkolKok70w4/jHu/eWbFoVubvm1inpXS2axj9xvt1+Xch/e0mgQzgrGBiw8cUnH/
         heoOmxHBN3khpfh8bUDyEQvij/JAn56ZGUPKHwjFHSVnRZR3ttet+MwnxmGLhCkvBAWb
         oeN+LfVCjX/FBHqAoTZcPEBZ9K/iOa4I/gG37GTHDTFcCBWEQO47+DvFOgjyMWQufskm
         yTZz+Q33wEdWfjR77JnyoWbiw0qN/32ZxdJu1ysaMi5fg8k1TO+Hg08kG5lxG96G6Zgl
         Zypg==
X-Gm-Message-State: AAQBX9fl0raE+MxSOxj/rCIuj8LrZQztPz1WFL4iRe6g2p4rcQ636Fnd
	8hG9sIUVIDw7u74qEztHAEiE8x30zT7ssQlh7q1wft8GKryJwj5OO1sla43xEqWAZ2pmC9/JLvk
	FcjjGYx7HcRo+E/2Vwp+13h1OIXu4n5VK/0pbm3F60wc3
X-Received: by 2002:a67:ee8d:0:b0:42f:e8fd:da7 with SMTP id n13-20020a67ee8d000000b0042fe8fd0da7mr3477653vsp.1.1682120346104;
        Fri, 21 Apr 2023 16:39:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350Y3BDEx0wdQjgGro7XLB/++nMWdvI+uCPhoipYb8afB40vTgna5qtCqU2CB+HQhaZ8CuxDk4E5to7hNNWxQ3hQ=
X-Received: by 2002:a67:ee8d:0:b0:42f:e8fd:da7 with SMTP id
 n13-20020a67ee8d000000b0042fe8fd0da7mr3477647vsp.1.1682120345813; Fri, 21 Apr
 2023 16:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
In-Reply-To: <CAAhSdy2RLinG5Gx-sfOqrYDAT=xDa3WAk8r1jTu8ReO5Jo0LVA@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 22 Apr 2023 01:38:54 +0200
Message-ID: <CABgObfbPB2NYwDLHnQSW0gtw0AX96KbeNOQsszw0NqytObyfaQ@mail.gmail.com>
Subject: Re: [GIT PULL] KVM/riscv changes for 6.4
To: Anup Patel <anup@brainfault.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	Atish Patra <atishp@atishpatra.org>, Atish Patra <atishp@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, KVM General <kvm@vger.kernel.org>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230421_163912_000249_A5C7E41D 
X-CRM114-Status: GOOD (  23.21  )
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

SGkgQW51cCwKCndoaWxlIHlvdSBkaWQgZml4IHRoZSBidWcgdGhhdCBjYXVzZWQgdGhlIG1haWxp
bmcgbGlzdCBkYXRlIHRvCmRpc2FwcGVhciwgSSBub3RpY2VkIHRoYXQgdGhlc2UgcGF0Y2hlcyBo
YXZlIGJlZW4gX2FwcGxpZWRfIChub3QganVzdApyZWJhc2VkKSBlYXJsaWVyIHRvZGF5LCBqdXN0
IGEgZmV3IGhvdXJzIGJlZm9yZSBzZW5kaW5nIHRoZSBwdWxsCnJlcXVlc3QuCgpUaGUgcHVsbCBy
ZXF1ZXN0IHdhcyBzZW50IGFyb3VuZCBtaWRuaWdodCwgSW5kaWFuIHRpbWUsIHdoaWxlIHRoZQpw
YXRjaGVzIHdlcmUgYXBwbGllZCBhcm91bmQgNS02cG0uIEkgIHJlY29nbml6ZWQgdGhhdCB0aGlz
IGlzIG5vdCBhCnJlYmFzZSBiZWNhdXNlIHRoZSBjb21taXQgZGF0ZXMgYXJlIGdyb3VwZWQgYWNj
b3JkaW5nIHRvIHRoZSB0b3BpY3NMCgoxNzozODo0MCArMDUzMCBLVk06IFJJU0MtVjogUmV0cnkg
ZmF1bHQgaWYgdm1hX2xvb2t1cCgpIHJlc3VsdHMgYmVjb21lIGludmFsaWQKMTc6Mzg6NDIgKzA1
MzAgUklTQy1WOiBLVk06IEFscGhhYmV0aXplIHNlbGVjdHMKMTc6Mzg6NDQgKzA1MzAgUklTQy1W
OiBLVk06IEFkZCBPTkVfUkVHIGludGVyZmFjZSB0byBlbmFibGUvZGlzYWJsZQpTQkkgZXh0ZW5z
aW9ucwoxNzozODo0NiArMDUzMCBSSVNDLVY6IEtWTTogQWxsb3cgWmJiIGV4dGVuc2lvbiBmb3Ig
R3Vlc3QvVk0KCjE3OjQ1OjM5ICswNTMwIFJJU0MtVjogQWRkIEFJQSByZWxhdGVkIENTUiBkZWZp
bmVzCjE3OjQ1OjQyICswNTMwIFJJU0MtVjogRGV0ZWN0IEFJQSBDU1JzIGZyb20gSVNBIHN0cmlu
ZwoxNzo0NTo0NCArMDUzMCBSSVNDLVY6IEtWTTogRHJvcCB0aGUgX01BU0sgc3VmZml4IGZyb20g
aGdhdHAuVk1JRCBtYXNrIGRlZmluZXMKMTc6NDU6NDggKzA1MzAgUklTQy1WOiBLVk06IEluaXRp
YWwgc2tlbGV0YWwgc3VwcG9ydCBmb3IgQUlBCjE3OjQ1OjUxICswNTMwIFJJU0MtVjogS1ZNOiBJ
bXBsZW1lbnQgc3VidHlwZSBmb3IgQ1NSIE9ORV9SRUcgaW50ZXJmYWNlCjE3OjQ1OjU0ICswNTMw
IFJJU0MtVjogS1ZNOiBBZGQgT05FX1JFRyBpbnRlcmZhY2UgZm9yIEFJQSBDU1JzCjE3OjQ1OjU4
ICswNTMwIFJJU0MtVjogS1ZNOiBVc2UgYml0bWFwIGZvciBpcnFzX3BlbmRpbmcgYW5kIGlycXNf
cGVuZGluZ19tYXNrCgoxODoxMDoyNyAyMDIzICswNTMwIFJJU0MtVjogS1ZNOiBWaXJ0dWFsaXpl
IHBlci1IQVJUIEFJQSBDU1JzCgpXaGF0IHRoaXMgbWVhbnMsIGlzIHRoYXQgdGhlcmUgaXMgbm8g
d2F5IHRoYXQgdGhlc2UgcGF0Y2hlcyBoYXZlIGJlZW4KdGVzdGVkIGJ5IGFueW9uZSBleGNlcHQg
eW91LiBQbGVhc2UgdHJ5IHRvIHB1c2ggdG8gdGhlIGt2bS1yaXNjdi9uZXh0CmJyYW5jaCBhcyBz
b29uIGFzIHBhdGNoZXMgYXJlIHJlYWR5LCBzaW5jZSB0aGF0IG1ha2VzIGl0IGVhc2llciB0bwpz
cG90IGNvbmZsaWN0cyBiZXR3ZWVuIGFyY2hpdGVjdHVyZXMuCgpJbiBmYWN0LCBzaW5jZSBSSVND
LVYgaXMgc3RpbGwgcHJldHR5IHNtYWxsLCBmZWVsIGZyZWUgdG8gc2VuZCBtZSBwdWxsCnJlcXVl
c3RzIGV2ZW4gZWFybHkgaW4gdGhlIGRldmVsb3BtZW50IHBlcmlvZCwgYXMgc29vbiBhcyBzb21l
IHBhdGNoZXMKYXJlIHJlYWR5LgoKUGFvbG8KCk9uIEZyaSwgQXByIDIxLCAyMDIzIGF0IDc6MzTi
gK9QTSBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPiB3cm90ZToKPgo+IEhpIFBhb2xv
LAo+Cj4gV2UgaGF2ZSB0aGUgZm9sbG93aW5nIEtWTSBSSVNDLVYgY2hhbmdlcyBmb3IgNi40Ogo+
IDEpIE9ORV9SRUcgaW50ZXJmYWNlIHRvIGVuYWJsZS9kaXNhYmxlIFNCSSBleHRlbnNpb25zCj4g
MikgWmJiIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiAzKSBBSUEgQ1NSIHZpcnR1YWxpemF0aW9u
Cj4gNCkgRmV3IG1pbm9yIGNsZWFudXBzIGFuZCBmaXhlcwo+Cj4gUGxlYXNlIHB1bGwuCj4KPiBQ
bGVhc2Ugbm90ZSB0aGF0IHRoZSBaaWNib3ogc2VyaWVzIGhhcyBiZWVuIHRha2VuIGJ5Cj4gUGFs
bWVyIHRocm91Z2ggdGhlIFJJU0MtViB0cmVlIHdoaWNoIHJlc3VsdHMgaW4gZmV3Cj4gbWlub3Ig
Y29uZmxpY3RzIGluIHRoZSBmb2xsb3dpbmcgZmlsZXM6Cj4gYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9od2NhcC5oCj4gYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oCj4gYXJjaC9yaXNj
di9rZXJuZWwvY3B1LmMKPiBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMKPiBhcmNoL3Jp
c2N2L2t2bS92Y3B1LmMKPgo+IEkgYW0gbm90IHN1cmUgaWYgYSBzaGFyZWQgdGFnIGNhbiBtYWtl
IHRoaW5ncyBlYXN5Cj4gZm9yIHlvdSBvciBQYWxtZXIuCj4KPiBSZWdhcmRzLAo+IEFudXAKPgo+
IFRoZSBmb2xsb3dpbmcgY2hhbmdlcyBzaW5jZSBjb21taXQgNmE4ZjU3YWUyZWIwN2FiMzlhNmYw
Y2NhZDYwYzc2MDc0MzA1MTAyNjoKPgo+ICAgTGludXggNi4zLXJjNyAoMjAyMy0wNC0xNiAxNToy
Mzo1MyAtMDcwMCkKPgo+IGFyZSBhdmFpbGFibGUgaW4gdGhlIEdpdCByZXBvc2l0b3J5IGF0Ogo+
Cj4gICBodHRwczovL2dpdGh1Yi5jb20va3ZtLXJpc2N2L2xpbnV4LmdpdCB0YWdzL2t2bS1yaXNj
di02LjQtMQo+Cj4gZm9yIHlvdSB0byBmZXRjaCBjaGFuZ2VzIHVwIHRvIDJmNGQ1OGY3NjM1YWVj
MDE0NDI4ZTczZWY2MTIwYzRkMDM3N2M0MzA6Cj4KPiAgIFJJU0MtVjogS1ZNOiBWaXJ0dWFsaXpl
IHBlci1IQVJUIEFJQSBDU1JzICgyMDIzLTA0LTIxIDE4OjEwOjI3ICswNTMwKQo+Cj4gLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LQo+IEtWTS9yaXNjdiBjaGFuZ2VzIGZvciA2LjQKPgo+IC0gT05FX1JFRyBpbnRlcmZhY2UgdG8g
ZW5hYmxlL2Rpc2FibGUgU0JJIGV4dGVuc2lvbnMKPiAtIFpiYiBleHRlbnNpb24gZm9yIEd1ZXN0
L1ZNCj4gLSBBSUEgQ1NSIHZpcnR1YWxpemF0aW9uCj4KPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gQW5kcmV3IEpvbmVz
ICgxKToKPiAgICAgICBSSVNDLVY6IEtWTTogQWxwaGFiZXRpemUgc2VsZWN0cwo+Cj4gQW51cCBQ
YXRlbCAoMTApOgo+ICAgICAgIFJJU0MtVjogS1ZNOiBBZGQgT05FX1JFRyBpbnRlcmZhY2UgdG8g
ZW5hYmxlL2Rpc2FibGUgU0JJIGV4dGVuc2lvbnMKPiAgICAgICBSSVNDLVY6IEtWTTogQWxsb3cg
WmJiIGV4dGVuc2lvbiBmb3IgR3Vlc3QvVk0KPiAgICAgICBSSVNDLVY6IEFkZCBBSUEgcmVsYXRl
ZCBDU1IgZGVmaW5lcwo+ICAgICAgIFJJU0MtVjogRGV0ZWN0IEFJQSBDU1JzIGZyb20gSVNBIHN0
cmluZwo+ICAgICAgIFJJU0MtVjogS1ZNOiBEcm9wIHRoZSBfTUFTSyBzdWZmaXggZnJvbSBoZ2F0
cC5WTUlEIG1hc2sgZGVmaW5lcwo+ICAgICAgIFJJU0MtVjogS1ZNOiBJbml0aWFsIHNrZWxldGFs
IHN1cHBvcnQgZm9yIEFJQQo+ICAgICAgIFJJU0MtVjogS1ZNOiBJbXBsZW1lbnQgc3VidHlwZSBm
b3IgQ1NSIE9ORV9SRUcgaW50ZXJmYWNlCj4gICAgICAgUklTQy1WOiBLVk06IEFkZCBPTkVfUkVH
IGludGVyZmFjZSBmb3IgQUlBIENTUnMKPiAgICAgICBSSVNDLVY6IEtWTTogVXNlIGJpdG1hcCBm
b3IgaXJxc19wZW5kaW5nIGFuZCBpcnFzX3BlbmRpbmdfbWFzawo+ICAgICAgIFJJU0MtVjogS1ZN
OiBWaXJ0dWFsaXplIHBlci1IQVJUIEFJQSBDU1JzCj4KPiBEYXZpZCBNYXRsYWNrICgxKToKPiAg
ICAgICBLVk06IFJJU0MtVjogUmV0cnkgZmF1bHQgaWYgdm1hX2xvb2t1cCgpIHJlc3VsdHMgYmVj
b21lIGludmFsaWQKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oICAgICAgICAgIHwg
MTA3ICsrKysrKysrKy0KPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oICAgICAgICB8
ICAgOCArCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2FpYS5oICAgICAgfCAxMjcgKysr
KysrKysrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1faG9zdC5oICAgICB8ICAxNCAr
LQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oIHwgICA4ICstCj4gIGFy
Y2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCAgICAgfCAgNTEgKysrKy0KPiAgYXJjaC9y
aXNjdi9rZXJuZWwvY3B1LmMgICAgICAgICAgICAgICB8ICAgMiArCj4gIGFyY2gvcmlzY3Yva2Vy
bmVsL2NwdWZlYXR1cmUuYyAgICAgICAgfCAgIDIgKwo+ICBhcmNoL3Jpc2N2L2t2bS9LY29uZmln
ICAgICAgICAgICAgICAgIHwgIDEwICstCj4gIGFyY2gvcmlzY3Yva3ZtL01ha2VmaWxlICAgICAg
ICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAgICAg
IHwgMzg4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9r
dm0vbWFpbi5jICAgICAgICAgICAgICAgICB8ICAyMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUu
YyAgICAgICAgICAgICAgICAgIHwgIDI4ICsrLQo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAg
ICAgICAgICAgICAgIHwgMTk0ICsrKysrKysrKysrKystLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL3Zj
cHVfaW5zbi5jICAgICAgICAgICAgfCAgIDEgKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5j
ICAgICAgICAgICAgIHwgMjQ3ICsrKysrKysrKysrKysrKysrKysrLS0KPiAgYXJjaC9yaXNjdi9r
dm0vdmNwdV9zYmlfYmFzZS5jICAgICAgICB8ICAgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS92bS5j
ICAgICAgICAgICAgICAgICAgIHwgICA0ICsKPiAgYXJjaC9yaXNjdi9rdm0vdm1pZC5jICAgICAg
ICAgICAgICAgICB8ICAgNCArLQo+ICAxOSBmaWxlcyBjaGFuZ2VkLCAxMTI5IGluc2VydGlvbnMo
KyksIDkxIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fYWlhLmgKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yva3ZtL2Fp
YS5jCj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
