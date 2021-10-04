Return-Path: <SRS0=53Iy=OY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B30C0C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 14:13:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 69EBB611C1
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Oct 2021 14:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 69EBB611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sG6lW3DbJ3yZ4VTM5+KFXQyojuwkMBYFIk3lIfxdKYA=; b=Y0+x9BUo5o4nPX
	U08oFnbprbTKeiVydir+iwH6CGz3NCZpq/0KpIaNAS5n18489JTxfLGdaqgs33Q+UUWcnG230lbH4
	Vtrq7+IXvzGmAeeolYdw6AyeTFTGOC/FageexO4H1kYOJ0mD5xaimsHWVFrXe7yOjF8YwlP5iSypp
	NjCbnhuU65mi0ZmfDNUI2dx4ueVmkUugp4p0EnxjnoKb1rV8GOpf/hQHwTJDRZr9c4NnKJWxaV4gP
	wd+id7TyNnq3rmynNsMmtAQ7MLN/RyWyg0zHSM1pyRK9g7Hkp8K/+xz4KcNIOJhFtm+lxz9an/b+E
	8IqPH1kZpyZYHxod8Y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXOiW-006jkX-Nt; Mon, 04 Oct 2021 14:13:20 +0000
Received: from mail-qv1-xf2d.google.com ([2607:f8b0:4864:20::f2d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXOiT-006jj6-W0
 for linux-riscv@lists.infradead.org; Mon, 04 Oct 2021 14:13:19 +0000
Received: by mail-qv1-xf2d.google.com with SMTP id cv2so10003441qvb.5
 for <linux-riscv@lists.infradead.org>; Mon, 04 Oct 2021 07:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=L+EigblI9CZVllHodJ0Te18frEx7k8TQPFGdDTx1ZMk=;
 b=dN3sI9wi6JeJJtKSMg2tECQmmTe3Sz9G57jImMDlA//qjnJDmEWmjM4yvPAz22exhC
 8hXE0FfZ0Ye0LHI7bX/uNX3+XsxFVmlogAET4kXGSrlqib9i98ig6M2+sYvXwq/LTn6Q
 B4LCiUqe+ZP71TbQXmPACKX8zFnNi36Y0WTtPYN7YiJ61s9cL6DGTLdePmMX67AzB2FI
 jLWXMWoBQKIBHfbdEBts+YA0a2ObWBadYVIT1wefcvp3x5z0GW5XIlplsAM7VhfSfmUq
 h3mByEmhvZBNDffghr/ey2T8KJ1OHkqUG++aAOA02a+2cOyR3KW0vKShj6TssNAAS/2A
 deEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=L+EigblI9CZVllHodJ0Te18frEx7k8TQPFGdDTx1ZMk=;
 b=fk1z9c5cgK98eGiL3eiUWyl/ud0C3xLBFLBU9v+sfPpeSo2u9OvQBmz9Ye9qARwS8c
 CkkHrRKBwbn+Rm7xAF8xdryTmasfGoAjty3d+Tb1mY08W9fDJciggWyF7S7+EFVrtn4/
 nwF0qAyy5Vjuj1+rT6XcPbcC4ZN7sqd+ZnVt/bcivftXAK23ORQYDOH1eWkDSrSSkgrY
 VEHVdXfFkDh18h7t0x/CVSby9vRQnTUH7qE9Blsl2OUBsr61G3ojltwrjg6EZ1N7QvJ0
 fVyvCsuQb976alYziA7C90BXL5kXKlPjniclN//QvAFv5UTVtCIJYVUDL6TfhdJ83A+9
 TPqg==
X-Gm-Message-State: AOAM531gUnINXP571E0ggzHHPYs85ton7VZLCMwyAuv0fRk6fc7jny+l
 m9BEn78CZSMhJb9MkgBas8E3AlJDjqhcCAAD8kcBvQ==
X-Google-Smtp-Source: ABdhPJzv8CAcyUpu5c1jJtxRXkpX+dENIvXy1k9mVhPqg1+C5B9Epg9UR8/6F5Ssz3WrMGSLYHs4RliEuaqaDggbzfU=
X-Received: by 2002:a0c:b3c9:: with SMTP id b9mr23582577qvf.40.1633356796361; 
 Mon, 04 Oct 2021 07:13:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1631121222.git.greentime.hu@sifive.com>
 <3b2d4ff556d310ed73a6910b89566a195fc28861.1631121222.git.greentime.hu@sifive.com>
 <20210915222937.49066323@xhacker>
In-Reply-To: <20210915222937.49066323@xhacker>
From: Greentime Hu <greentime.hu@sifive.com>
Date: Mon, 4 Oct 2021 22:13:05 +0800
Message-ID: <CAHCEeh+qLpGy9VRKgFw57zNs8J5BWYYArJpTobcz98+mKJW2yQ@mail.gmail.com>
Subject: Re: [RFC PATCH v8 20/21] riscv: Optimize task switch codes of vector
To: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
Cc: linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Vincent Chen <vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211004_071318_084982_D1639868 
X-CRM114-Status: GOOD (  16.94  )
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

SmlzaGVuZyBaaGFuZyA8anN6aGFuZzNAbWFpbC51c3RjLmVkdS5jbj4g5pa8IDIwMjHlubQ55pyI
MTXml6Ug6YCx5LiJIOS4i+WNiDEwOjM25a+r6YGT77yaCj4KPiBPbiBUaHUsICA5IFNlcCAyMDIx
IDAxOjQ1OjMyICswODAwCj4gR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNvbT4g
d3JvdGU6Cj4KPiA+IFRoaXMgcGF0Y2ggcmVwbGFjZWVzIDIgaW5zdHJ1Y3Rpb25zIHdpdGggMSBp
bnN0cnVjdGlvbiB0byBkbyB0aGUgc2FtZSB0aGluZwo+ID4gLiByczE9eDAgd2l0aCByZCAhPSB4
MCBpcyBhIHNwZWNpYWwgZm9ybSBvZiB0aGUgaW5zdHJ1Y3Rpb24gdGhhdCBzZXRzIHZsIHRvCj4g
PiBNQVhWTC4KPgo+IFNpbWlsYXJseSwgdGhlIHZlY3Rvci5TIGlzIG5ld2x5IGludHJvZHVjZWQg
aW4gdGhpcyBwYXRjaCBzZXQsIHNvIGNvdWxkCj4gdGhpcyBvcHRpbWl6YXRpb24gYmUgZm9sZGVk
IGludG8gdGhlIF9fdnN0YXRlX3NhdmUgYW5kIF9fdnN0YXRlX3Jlc3RvcmUKPiBpbnRyb2R1Y3Rp
b24gcGF0Y2g/IE9yIGl0J3MgYmV0dGVyIHRvIGtlZXAgdGhpcyBvcHRpbWl6YWlvbiBpbiBjb21t
aXQgbG9nPwo+ClllYWgsIEkgd2FudGVkIHRvIGtlZXAgdGhlIG9wdGltaXphdGlvbiBjb21taXQg
bG9nIGJlZm9yZSwgYnV0IGl0J3Mgb2sKaWYgeW91IHRoaW5rIG1lcmdlIGNvZGUgaXMgZWFzaWVy
IHRvIHJlYWQuCkknbGwgbWVyZ2UgdGhpcyBwYXRjaCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKPiA+
Cj4gPiBTdWdnZXN0ZWQtYnk6IEFuZHJldyBXYXRlcm1hbiA8YW5kcmV3QHNpZml2ZS5jb20+Cj4g
PiBDby1kZXZlbG9wZWQtYnk6IFZpbmNlbnQgQ2hlbiA8dmluY2VudC5jaGVuQHNpZml2ZS5jb20+
Cj4gPiBTaWduZWQtb2ZmLWJ5OiBWaW5jZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29t
Pgo+ID4gU2lnbmVkLW9mZi1ieTogR3JlZW50aW1lIEh1IDxncmVlbnRpbWUuaHVAc2lmaXZlLmNv
bT4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5TIHwgOSArKystLS0tLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZWN0b3IuUyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3ZlY3Rvci5TCj4gPiBpbmRleCA0ZjBjNWExNjZlNGUuLmY3MjIzYzgxYjExYSAxMDA2
NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3ZlY3Rvci5TCj4gPiArKysgYi9hcmNoL3Jp
c2N2L2tlcm5lbC92ZWN0b3IuUwo+ID4gQEAgLTI3LDggKzI3LDcgQEAKPiA+ICAjZGVmaW5lIHhf
dmwgICAgIHQyCj4gPiAgI2RlZmluZSB4X3Zjc3IgICB0Mwo+ID4gICNkZWZpbmUgaW5jciAgICAg
dDQKPiA+IC0jZGVmaW5lIG1fb25lICAgIHQ1Cj4gPiAtI2RlZmluZSBzdGF0dXMgICB0Ngo+ID4g
KyNkZWZpbmUgc3RhdHVzICAgdDUKPiA+Cj4gPiAgRU5UUlkoX192c3RhdGVfc2F2ZSkKPiA+ICAg
ICAgIGxpICAgICAgc3RhdHVzLCBTUl9WUwo+ID4gQEAgLTM4LDggKzM3LDcgQEAgRU5UUlkoX192
c3RhdGVfc2F2ZSkKPiA+ICAgICAgIGNzcnIgICAgeF92dHlwZSwgQ1NSX1ZUWVBFCj4gPiAgICAg
ICBjc3JyICAgIHhfdmwsIENTUl9WTAo+ID4gICAgICAgY3NyciAgICB4X3Zjc3IsIENTUl9WQ1NS
Cj4gPiAtICAgICBsaSAgICAgIG1fb25lLCAtMQo+ID4gLSAgICAgdnNldHZsaSBpbmNyLCBtX29u
ZSwgZTgsIG04Cj4gPiArICAgICB2c2V0dmxpIGluY3IsIHgwLCBlOCwgbTgKPiA+ICAgICAgIHZz
ZTgudiAgIHYwLCAoZGF0YXApCj4gPiAgICAgICBhZGQgICAgIGRhdGFwLCBkYXRhcCwgaW5jcgo+
ID4gICAgICAgdnNlOC52ICAgdjgsIChkYXRhcCkKPiA+IEBAIC02MSw4ICs1OSw3IEBAIEVOVFJZ
KF9fdnN0YXRlX3Jlc3RvcmUpCj4gPiAgICAgICBsaSAgICAgIHN0YXR1cywgU1JfVlMKPiA+ICAg
ICAgIGNzcnMgICAgQ1NSX1NUQVRVUywgc3RhdHVzCj4gPgo+ID4gLSAgICAgbGkgICAgICBtX29u
ZSwgLTEKPiA+IC0gICAgIHZzZXR2bGkgaW5jciwgbV9vbmUsIGU4LCBtOAo+ID4gKyAgICAgdnNl
dHZsaSBpbmNyLCB4MCwgZTgsIG04Cj4gPiAgICAgICB2bGU4LnYgICB2MCwgKGRhdGFwKQo+ID4g
ICAgICAgYWRkICAgICBkYXRhcCwgZGF0YXAsIGluY3IKPiA+ICAgICAgIHZsZTgudiAgIHY4LCAo
ZGF0YXApCj4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
