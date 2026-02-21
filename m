Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F0B4C61DE5
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 10:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dC9vEy5GDistWSKTlc7yy6xN+S77QUq+SkRJIS6DZ1E=; b=1bgGiycsqvNIVw
	+0ngz5crSf012CAFz81vKAAGa4M5h9dufK3m7VCwN2YNP/MfcPYgdPtscg3pJxr6MC8dPyjc0bdoq
	pQRxG1Ohw+SYpyWKkjpG5uECmnv5beKMbaOfjthqMvVzZ0SqTYBRT7OoZ2aI0dMFs6CBp8OY1rS06
	MS1GNh13QWrmVthXMloqEQdyw1TZpDigxyJrNKe0Gr7clL5VI/Vdzqb5BRwkNlwIA9mr3XsOSI5XC
	ZCF5DVlFFMX8gsc8YTpGftzYjTMTnMriarixdGlC8sO7w8mb8HVX++SjckKF9m4ubpg2YB2SwypOc
	eE5WS+1d2VkM+TTt32sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkYI-0000000FzK0-0Itp;
	Sat, 21 Feb 2026 10:49:34 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtkYE-0000000FzJG-3LEu
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 10:49:32 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-64ad9fabd08so2774094d50.2
        for <linux-riscv@lists.infradead.org>; Sat, 21 Feb 2026 02:49:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771670969; cv=none;
        d=google.com; s=arc-20240605;
        b=gnuTpZLiIBmbMzqXSH2blZzV6/ZhsK0CZMSJDG2Djeb+05MvfpCsTxXAPSiPhR4CKh
         iU6mWmwW7NeeNSB18ZRm0+b1u6DsPSXSwOsw8b+a7Sp9C0/7A5+bI4LKS5fDJjeu9sNx
         PrjAgfugLRQEnhkuQDNsJwi3EM52675E56yFjxnA+waBC60Tt5J+6wfNll7e+dmUcUIB
         haXRWvCoiy4dsMZS70cudlqcEa8j/awXmqQWiIUkyAA+2Idl2Ix7orAqzDxyQ8DWCxzV
         9cmQsxhpGxFlgGcticnPrlpUFdS1vGXv25jplerUrOCWxfo3C3htAI9RafwrpsSqKLSe
         ZKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9TNS5VFp2OtSYclpYYMlkswuqleo0XcOqWN7QFvC4nE=;
        fh=d0wnk8vmmNiu8FQsZSqvpeeSh4RewEXm4Y01U7H20ew=;
        b=jUZ1hVC/zCZwabmL1zp1DwlK6LL+tWw3brsGWomQrfqf5L2BYfUSvSk0ZUk4GtD1+J
         tGI9+p9JghTiVx1bcLA7DEQq+2wjPhfJVGhTae4o7Pdk2PUaehAQLnjdwWAkSxao68w3
         wVPQctCLTw24Chpk6wUdJVBs4l9ijRL2uwZfXyV2IC86tptwCJAdeGXOCvc0UEB5M8Pq
         HU9Sm1bJeGflFULVdn9b7hdPOOTTpceW0f0Nyh+Lpy2J41cOQ6bRAoSYzWyNgdmi3JHA
         PtN4bvFIgkCX369elBl7jbypf5zRLbQ3Vly4zEsAFi9MqfTD4GYXUr9R6Sj6RdJr03Pv
         dL6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1771670969; x=1772275769; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9TNS5VFp2OtSYclpYYMlkswuqleo0XcOqWN7QFvC4nE=;
        b=lUhWPTGB1PwiRrcQX0qfjBj43u6YjUa9jL5XUAl6+VlkKw8wDjo+IMG4ku2NOt8ZLC
         0YZ/KBEoeqaf0j/QIJIFVhW+eESr3GXbAqN/d3av9xN5cbVQ/xxsEH4nyh7AvvQnZXoH
         y+ui6CwFo1PwPBjZqyRwj291i2zM/hXMP6RfAsIvlfNzz0aoROHxoKVkb/qUj7O/dAlb
         UHfNeoBFAEMbr4Xm0Gnsbrvit/9P/93JSluJDhidACFSiF9tSb1jK42g2qd5NlG0rPEz
         O8bV3OYZ1oub/lAsDcoiWklPjF0hKh9SW2Rc5e6xI2QqUoflaeUsgFXXn3N7+t4LuHiW
         ppLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771670969; x=1772275769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9TNS5VFp2OtSYclpYYMlkswuqleo0XcOqWN7QFvC4nE=;
        b=fYOpUVg7Z3m6gn1YdXIhKeS8Q/g978iLC3zRXj5bD3lqZ+IJK0IwoATd72KpyPOEpN
         QezCbWHTVEnpkNJfXD0X+8lgS7RRnIvO3Cud24oqqTz2eo1UoUbOq0YwhkSu20pSduS/
         guoQTSOOzeKLgmndfOzAOrNr/KiXliW1X5d79qmIsmOh4Dj3qrLS0MLPGip9ndeAofKW
         aKy7BZER+mWvmMHJy3Akbxovrnx3qjVpkOXjtiB1qD+IK5wkCugaatFyV96HyLyl0wsz
         Sd9v0tJV1PzQUy80uAiUcNcthbAYYOUvQwnvTeuSdtXgnGF65OR+XTAzPf3XmUk3t2TP
         UgIg==
X-Forwarded-Encrypted: i=1; AJvYcCVPO4/v32SM3upIPFi/trgC7W0QSIt7Vdw+zQ08f3ZsvIPqHUUMPYgXHVeK2NjHAoyY1w5hp/eB3d6Lbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0vHDAV4bm0bYwddiM60ZNbqL26M1fVjz5xf5CK7/WWFreHEQE
	KUqM5xRp6wwXxzUQ+MAO44tV8X+s5e8eesVHxTIr5uNqwQ6cqbIyp3sOTyk1ku8/tDq92QbiO17
	2yNPHR5oC9DxwGllaUNe8hyhV4NscOnCtSwGKhqEilA==
X-Gm-Gg: AZuq6aJeCDvo+ckkUwx7x2ihW9QC+XUdc+/7gNwm5M/4zH/HryzRPyvbbAjhzIOpBkW
	2k7JzCZEJ0K/zVKgUdsnEdYRr+By79KV7GvKKp2QNa7Lq13t1cWlYWqg1Dk2JBMfvonQq+IAyo3
	9rTUB7U1KSyckdpU+KlZbVtVEd0f0NlHrDHp55TYTguRLlZFrsXtu/64X7JTYrFNZoX3ljotGEe
	vFR+yvoKsPeDgfzFY9DxmHqwXToclIoOIco68iwIoMx0yL8RZ7HdTDq0FjcmBoMjBQ9IhVGLe3J
	MVCxwZGkZLWVb5gzDWFKCVYuTZOfApNf+jFUbE61gbF9BBqF214=
X-Received: by 2002:a05:690e:12ca:b0:644:7933:ae8a with SMTP id
 956f58d0204a3-64c787d4d86mr2116237d50.16.1771670969304; Sat, 21 Feb 2026
 02:49:29 -0800 (PST)
MIME-Version: 1.0
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com> <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
In-Reply-To: <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 21 Feb 2026 18:49:18 +0800
X-Gm-Features: AaiRm50-Nd8DvhuwtjTpj63edqqgIHwZuLPXqUXWXlhq8AT7aQHbuBkQWQHaDfM
Message-ID: <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
To: Andrew Jones <andrew.jones@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Charlie Jenkins <thecharlesjenkins@gmail.com>, Samuel Holland <samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_024931_124674_798BAA62 
X-CRM114-Status: GOOD (  18.30  )
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

SGksIERyZXcKCk9uIEZyaSwgRmViIDYsIDIwMjYgYXQgODoyNOKAr0FNIEFuZHJldyBKb25lcwo8
YW5kcmV3LmpvbmVzQG9zcy5xdWFsY29tbS5jb20+IHdyb3RlOgo+Cj4gQWRkIEIgdG8gaHdjYXAg
YW5kIGVuc3VyZSB3aGVuIEIgaXMgcHJlc2VudCB0aGF0IFpiYSwgWmJiLCBhbmQgWmJzCj4gYXJl
IGFsbCBzZXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bv
c3MucXVhbGNvbW0uY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2h3Y2FwLmgg
ICAgICB8IDEgKwo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdjYXAuaCB8IDEgKwo+
ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcHVmZWF0dXJlLmMgICAgICB8IDggKysrKysrKysKPiAgMyBm
aWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCgpJIHNhdyB5b3UgY2hvc2Ugbm90IHRvIGFk
ZCBCIHRvIGh3cHJvYmUgaW4gdGhpcyBzZXJpZXMsIHBlcgp5b3VyIHJldmlldyBvZiBteSBwYXRj
aCBbMV0uIEkgaGF2ZSBhIGRpZmZlcmVudCBvcGluaW9uLgoKQXMgeW91IHNhaWQsIEZELCBDLCBh
bmQgViBhcmUgYWxsIGV4cG9ydGVkIHRocm91Z2ggYm90aCBod2NhcAphbmQgaHdwcm9iZS4gQWRk
aW5nIEIgdG8gaHdwcm9iZSB0b28ga2VlcHMgdGhpbmdzIGNvbnNpc3RlbnQsCnVzZXJzIGNhbiBx
dWVyeSBhbGwgdGhlIHNpbmdsZS1sZXR0ZXIgZXh0ZW5zaW9ucyBmcm9tIG9uZQppbnRlcmZhY2Ug
d2l0aG91dCBuZWVkaW5nIHRvIGtub3cgdGhhdCBCIGlzIG1pc3NpbmcgaW4gaHdwcm9iZQphbmQg
dGhhdCB0aGV5J2QgaGF2ZSB0byBjaGVjayBaYmEvWmJiL1picyB0byBpbmZlciBCIHN1cHBvcnQu
CgpSZWx5aW5nIG9uIHRoZSBydmEyM3U2NCBiYXNlIGJpdCB0byBpbXBseSBCIGFsc28gZG9lc24n
dCBjb3ZlcgpjaGlwcyB0aGF0IGltcGxlbWVudCBCIHdpdGhvdXQgYmVpbmcgcnZhMjN1NjQgY29t
cGxpYW50LiBFZy4gbXkKcGF0Y2hzZXQgWzJdIGFkZHMgc3VwcG9ydCBmb3IgZXhpc3RpbmcgKG5v
bi1ydmEyM3U2NCkgU29Dcy4KCkxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9rM3Jp
a3NnamNpM2p3N3RncWYyN3R1NnZyZnhmczZlN2pvNWppbnd3YWR5cnV5cWdiNkBhcHF5aW00emRj
cWMvClsxXQpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAxMTUtYWRkaW5n
LWItZHRzaS12Mi0wLTI1NGRkNjFjZjk0N0ByaXNjc3Rhci5jb20vClsyXQoKVGhhbmtzLApHdW9k
b25nCgoKCkd1b2RvbmcKCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gaW5kZXggMDNhY2QyMmJi
YmFhLi5jMTdlMTFjYWNhODMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9o
d2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oCj4gQEAgLTExLDYg
KzExLDcgQEAKPiAgI2luY2x1ZGUgPHVhcGkvYXNtL2h3Y2FwLmg+Cj4KPiAgI2RlZmluZSBSSVND
Vl9JU0FfRVhUX0EgICAgICAgICAgICAgICAgKCdhJyAtICdhJykKPiArI2RlZmluZSBSSVNDVl9J
U0FfRVhUX0IgICAgICAgICAgICAgICAgKCdiJyAtICdhJykKPiAgI2RlZmluZSBSSVNDVl9JU0Ff
RVhUX0MgICAgICAgICAgICAgICAgKCdjJyAtICdhJykKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhU
X0QgICAgICAgICAgICAgICAgKCdkJyAtICdhJykKPiAgI2RlZmluZSBSSVNDVl9JU0FfRVhUX0Yg
ICAgICAgICAgICAgICAgKCdmJyAtICdhJykKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL3VhcGkvYXNtL2h3Y2FwLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdjYXAu
aAo+IGluZGV4IGM1MmJiN2JiYmFiZS4uOTZiN2NmODU0ZTA5IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvaW5jbHVkZS91YXBpL2FzbS9od2NhcC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2h3Y2FwLmgKPiBAQCAtMjEsNiArMjEsNyBAQAo+ICAjZGVmaW5lIENPTVBBVF9I
V0NBUF9JU0FfRiAgICAgKDEgPDwgKCdGJyAtICdBJykpCj4gICNkZWZpbmUgQ09NUEFUX0hXQ0FQ
X0lTQV9EICAgICAoMSA8PCAoJ0QnIC0gJ0EnKSkKPiAgI2RlZmluZSBDT01QQVRfSFdDQVBfSVNB
X0MgICAgICgxIDw8ICgnQycgLSAnQScpKQo+ICsjZGVmaW5lIENPTVBBVF9IV0NBUF9JU0FfQiAg
ICAgKDEgPDwgKCdCJyAtICdBJykpCj4gICNkZWZpbmUgQ09NUEFUX0hXQ0FQX0lTQV9WICAgICAo
MSA8PCAoJ1YnIC0gJ0EnKSkKPgo+ICAjZW5kaWYgLyogX1VBUElfQVNNX1JJU0NWX0hXQ0FQX0gg
Ki8KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggMjVlZDFkNjk1OGQ3Li5jYTdhMzRmNjY3
MzggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTQyOSw2ICs0MjksMTIgQEAgc3Rh
dGljIGNvbnN0IHVuc2lnbmVkIGludCByaXNjdl9jX2V4dHNbXSA9IHsKPiAgICAgICAgIFJJU0NW
X0lTQV9FWFRfWkNELAo+ICB9Owo+Cj4gK3N0YXRpYyBjb25zdCB1bnNpZ25lZCBpbnQgcmlzY3Zf
Yl9leHRzW10gPSB7Cj4gKyAgICAgICBSSVNDVl9JU0FfRVhUX1pCQSwKPiArICAgICAgIFJJU0NW
X0lTQV9FWFRfWkJCLAo+ICsgICAgICAgUklTQ1ZfSVNBX0VYVF9aQlMsCj4gK307Cj4gKwo+ICAv
Kgo+ICAgKiBUaGUgY2Fub25pY2FsIG9yZGVyIG9mIElTQSBleHRlbnNpb24gbmFtZXMgaW4gdGhl
IElTQSBzdHJpbmcgaXMgZGVmaW5lZCBpbgo+ICAgKiBjaGFwdGVyIDI3IG9mIHRoZSB1bnByaXZp
bGVnZWQgc3BlY2lmaWNhdGlvbi4KPiBAQCAtNDc2LDYgKzQ4Miw3IEBAIGNvbnN0IHN0cnVjdCBy
aXNjdl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ICAgICAgICAgX19SSVNDVl9J
U0FfRVhUX0RBVEFfVkFMSURBVEUoZCwgUklTQ1ZfSVNBX0VYVF9ELCByaXNjdl9leHRfZF92YWxp
ZGF0ZSksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfREFUQShxLCBSSVNDVl9JU0FfRVhUX1Ep
LAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKGMsIFJJU0NWX0lTQV9FWFRfQywg
cmlzY3ZfY19leHRzKSwKPiArICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVChiLCBSSVND
Vl9JU0FfRVhUX0IsIHJpc2N2X2JfZXh0cyksCj4gICAgICAgICBfX1JJU0NWX0lTQV9FWFRfU1VQ
RVJTRVRfVkFMSURBVEUodiwgUklTQ1ZfSVNBX0VYVF9WLCByaXNjdl92X2V4dHMsIHJpc2N2X2V4
dF92ZWN0b3JfZmxvYXRfdmFsaWRhdGUpLAo+ICAgICAgICAgX19SSVNDVl9JU0FfRVhUX0RBVEEo
aCwgUklTQ1ZfSVNBX0VYVF9IKSwKPiAgICAgICAgIF9fUklTQ1ZfSVNBX0VYVF9TVVBFUlNFVF9W
QUxJREFURSh6aWNib20sIFJJU0NWX0lTQV9FWFRfWklDQk9NLCByaXNjdl94bGludXhlbnZjZmdf
ZXh0cywgcmlzY3ZfZXh0X3ppY2JvbV92YWxpZGF0ZSksCj4gQEAgLTEwODksNiArMTA5Niw3IEBA
IHZvaWQgX19pbml0IHJpc2N2X2ZpbGxfaHdjYXAodm9pZCkKPiAgICAgICAgIGlzYTJod2NhcFsn
ZicgLSAnYSddID0gQ09NUEFUX0hXQ0FQX0lTQV9GOwo+ICAgICAgICAgaXNhMmh3Y2FwWydkJyAt
ICdhJ10gPSBDT01QQVRfSFdDQVBfSVNBX0Q7Cj4gICAgICAgICBpc2EyaHdjYXBbJ2MnIC0gJ2En
XSA9IENPTVBBVF9IV0NBUF9JU0FfQzsKPiArICAgICAgIGlzYTJod2NhcFsnYicgLSAnYSddID0g
Q09NUEFUX0hXQ0FQX0lTQV9COwo+ICAgICAgICAgaXNhMmh3Y2FwWyd2JyAtICdhJ10gPSBDT01Q
QVRfSFdDQVBfSVNBX1Y7Cj4KPiAgICAgICAgIGlmICghYWNwaV9kaXNhYmxlZCkgewo+IC0tCj4g
Mi40My4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
