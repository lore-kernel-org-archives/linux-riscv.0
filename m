Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D836C5AC82
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vnPY65QlhBRLa1UCxVfvraVnfICl4lTveGxiKBcLnJ8=; b=bjMKn85IuVAfcT
	QxNXQUUwoUNJ2egswML/DAiCnxRunIqMyCNXeSS8UGoU4eH6GJRG4FpBuDYI6DSLqSVzLcHqEwgim
	vIN/8Kjqe/vOxPtpno5FM6q2p69X8L+BPiWme4KflmIHLGDE6CKJb05Yfaq7PwvqqHWs/SYVmGSRc
	wZLhVVqZfrspbP9BP6GsPV9RAdO+D0QlXN30asnmJLL+5AV8i8jmzaMUEp6i+9LdR5R8tUQSkc+9W
	BI4k2lpkSaBaW5T40ug3122pNxhbItHWkT/3AWQrZboMnHghFomHMpGhhGf7/xV/kNALS87I1m/Od
	/p1eEaqspUhk4e4jvW/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNcZ-00000008RV5-0vIB;
	Fri, 07 Aug 2026 16:40:35 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNcW-00000008RTc-0x49
	for linux-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 16:40:33 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-495757ccbc1so38187885e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 09:40:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120829; cv=none;
        d=google.com; s=arc-20260327;
        b=CktEGNk+yQLFAvwwL/cyYZgrsOIhArKsIW0LoBEtMBvWOTBI29x8weiwt8Slk5AQbk
         cWyAi8Pmkx8oezN/5C+zGqhJzLp+Jep9VAAZmWkOzMCM03uOvuxkxczny+jiF4k2lcOP
         UEfQskOaZBalufag1HnU0FhDzKWJF9C5wEHENRAE+JeGxAfnQFfMHoX3VMK90lEhabXS
         Frq4/aHo5CyMHAwtuadjf+3Hg+XkozUNzlgxQ9fFS0ivGu9NTrtrUCcy1V1jbtaLc9rk
         r0nJC4N/TvElApc2eybbDKuXV9sZrJSYMDJH6oCgQIaa3Usv2kO5d/mOvPesdYMurRLF
         s9Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GSyds6W5OQ66XFXpi1LlEJdTPFK3iE4acomSvTp9bj8=;
        fh=qF7Wjn+MAVZ8S/o9HXeBJOEHhqzU6dfhhxde0ktssrA=;
        b=eJI3TOyo0Aya8xN5gNLdNz5ev2k1QdAeOVFUDsW8pD7GPc4ZzhNf6JxxM7csajL6KA
         m1GORdXEQQKcQkVZ31nB02QWHTCK/XZE1fBQr2Q7Ox+PGJcMYJyweLD9wl4SopSetymb
         5cssTr8Rh9OIq90Dvcm/7pmKWsyjgMXzAGiIAWQ0x8b81RzKRJvRUEuREPoy48suadq5
         GpncspCEMOnHG1mVP6E1Fy/j7CV6sX/0exemtWeYMQeV5qpMg2PfuQ6xA+EGqEO9b/nJ
         fSIgxfvq6IBj3X2EENgF0/zEp4Yu7NdprUY8fdZ7/g05jQjE8RPvPoyU9RcwRLzRosK1
         cT1A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786120829; x=1786725629; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GSyds6W5OQ66XFXpi1LlEJdTPFK3iE4acomSvTp9bj8=;
        b=gfc9Xs4/Vrbmck0liJQCvPu/jRCdnI8K8/vkvoI4ug+K2jMWuq3b57cRonQCDgGwDe
         rWXE1oQ5kYukHcCPEmkmfSM7Lkkm7UvI8kGgdT3F5oTCRIgntRHIZ2sg7zxliZcEDihw
         qmj7TrSWxQawn6KJgkMjVvtdP3Wbfd1jawd8dHbEVMHlCIeAIBLDLcP9PLL5zYKz1pKv
         BkM1py3f/lHqjSC3S+jt4E9+pKvKmg0hZFEQjr+MMl9fCeM8clY34+pXkC0xxkeU0Xbb
         ani+vPWte3pAQ6fVCybFotO/jqDBqH9diVkEgjSiRcd1l6BU7KtQm9dZh1Z5Zqq2eWvl
         V/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120829; x=1786725629;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GSyds6W5OQ66XFXpi1LlEJdTPFK3iE4acomSvTp9bj8=;
        b=arISxGJtMmnRS8p0yttO/Dwwph0rFEemrkOjZouKMlsCAS+wHutYKBO/ujURZ+5pmo
         5Lmq+eQbOkf4W41Bl5JW9k48krLVzn0HEXaMlBPt6WFPDplW7ttngg41VVL2+J4CeB28
         oNNaZKU0bZE/1FKBDCEB9zySwTXxV7rt8P8YfO3y55uFw/OfWk7UEMlEFALX5t9Lv+Jn
         +KzR2vVLsEtUg6cR9m33Ub0yfW6mqsQ0CYAUR2za176nfSt0k2p2+j2llLN5n7rsrnES
         prij1cM3JQ4x5q6pq13y4SLGQa9rgrny5uTCZyMiSh86PV19JtuDHJMOq4favxwoLYkt
         oYOw==
X-Forwarded-Encrypted: i=1; AHgh+RppkyO1zBXnX5BsJVJZeiqBE+dcYlvs+v3/M4jQPvyzHqQ7KiDVlMfTqj0sxtg2R9yjWTsfBcJJYXWDug==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyyNWJs1X2wubOl4otk9YK+NCoGdH4KdNuX6LRmO3u4ZBuyw5N
	E5XXjEu1CxQZaY18cuYKzOt9W8Ami91AN1TFXzNzdG2G2kKQJuPAkPNqA0+qfMDWNrIdcI1dqLV
	EsAeWtQNweQyxa/KIJsf5xIlPBqWr1qT+u+iS1VgHsw==
X-Gm-Gg: AR+sD10ZocaLngKOLOUVuQO/seN9tPtq/WPL9OXm6Iu4Sh66xPxwOsQrxjDqVTy10nK
	mvVqxa8SvbeTSBYx0mpt0gdMX4v5GxQSMHhVdIBpRkQNbwT0MSIN0wzqYIla3GUNw/cx8WHAaRg
	bZNO7eiiwnOD3v+tzeG5aEvsSAG/1a1+pNSy2G4/mp5yCe3ih/a+6qnB/tHUyrGgLSqkQ5PBGP+
	oP+LiSl53NbRyGq1JM3VrU0374bu8ryAhauT7nMUfRDezKm5uDDhL26npAQUdNjNhaF74qMLGqp
	jb7n0pGZDE3Ah6daaqYYySFhFuDQYWp5jQFyJnJ1uzboE7wukutKQxYzYR6vCuo7VRrkkJZFi37
	QKCBHvurMdhJI17icUp12pg4hVyvWv/FHFtyZo394nREJj8xwKQRTtNXy+yAXGy/s
X-Received: by 2002:a05:600c:3545:b0:499:52dd:c1f0 with SMTP id
 5b1f17b1804b1-49952ddd05amr206480125e9.1.1786120828407; Fri, 07 Aug 2026
 09:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260717080654.877151-1-wang.yechao255@zte.com.cn>
In-Reply-To: <20260717080654.877151-1-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Aug 2026 22:10:16 +0530
X-Gm-Features: AUfX_mzs5xvuhUuNS2PSxFtD2Spckea2gbhirvVXYUtFbIp9N-L4RwLlBOai4MM
Message-ID: <CAAhSdy1g5Qa0OVUyjfz4c+bySkcXyk12LcSnsuDUOCCQo=7_ZQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Improve dirty log clearing by skipping zero
 bits in mask
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094032_308010_B93047C5 
X-CRM114-Status: GOOD (  29.55  )
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

T24gRnJpLCBKdWwgMTcsIDIwMjYgYXQgMTozOeKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IFRoZSBleGlzdGluZyBrdm1fcmlzY3ZfZ3N0YWdl
X3dwX3JhbmdlKCkgd2Fsa3MgdGhlIGVudGlyZSBbc3RhcnQsIGVuZCkKPiByYW5nZSB0byBhcHBs
eSB3cml0ZSBwcm90ZWN0aW9uIGZvciBkaXJ0eSBsb2cgY2xlYXJpbmcsIGV2ZW4gd2hlbiB0aGUK
PiBwcm92aWRlZCBtYXNrIGhhcyB6ZXJvIGJpdHMgKGkuZS4sIG1hbnkgR0ZOcyBkbyBub3QgbmVl
ZCBwcm90ZWN0aW9uKS4KPiBUaGlzIGxlYWRzIHRvIHVubmVjZXNzYXJ5IHBhZ2UgdGFibGUgd2Fs
a3Mgd2hlbiB0aGUgbWFzayBpcyBzcGFyc2UuCj4KPiBSZXBsYWNlIHRoZSByYW5nZS1iYXNlZCBh
cHByb2FjaCB3aXRoIGEgbmV3IGZ1bmN0aW9uCj4ga3ZtX3Jpc2N2X2dzdGFnZV93cF9wdF9tYXNr
ZWQoKSB0aGF0IGl0ZXJhdGVzIG9ubHkgb3ZlciB0aGUgc2V0IGJpdHMgaW4KPiB0aGUgbWFzay4g
Rm9yIGVhY2ggc2V0IGJpdCwgaXQgbG9va3MgdXAgdGhlIGxlYWYgUFRFIGFuZCBhcHBsaWVzIHdy
aXRlCj4gcHJvdGVjdGlvbi4gT25jZSBhIGh1Z2UgcGFnZSBpcyBlbmNvdW50ZXJlZCwgdGhlIGVu
dGlyZSBodWdlLXBhZ2UgcmFuZ2UKPiBpcyBwcm9jZXNzZWQgaW4gb25lIGdvLCBhbmQgdGhlIGNv
cnJlc3BvbmRpbmcgYml0cyBpbiB0aGUgbWFzayBhcmUgY2xlYXJlZAo+IHVzaW5nIGJpdG1hcF9j
bGVhcigpLgo+Cj4gUGVyZm9ybWFuY2Ugd2FzIG1lYXN1cmVkIHdpdGggS1ZNIHNlbGZ0ZXN0cyBk
aXJ0eV9sb2dfcGVyZl90ZXN0IG9uIGEKPiBTcGFjZW1pdCBrMyBob3N0IHdpdGggdGhlIGZvbGxv
d2luZyBjb25maWd1cmF0aW9uOgo+IC0gdkNQVXM6IDIgKC12IDIpCj4gLSBNZW1vcnk6IDFHQiAo
LWIgMUcpCj4gLSBJdGVyYXRpb25zOiAzICgtaSAzKQo+IC0gV3JpdGUgcGVyY2VudGFnZSB2YXJp
ZWQgdmlhIC13IHBhcmFtZXRlciB0byBzaW11bGF0ZSBkaWZmZXJlbnQKPiAgIGRpcnR5IG1hc2sg
ZGVuc2l0aWVzLgo+Cj4gVGhlIGZvbGxvd2luZyBkYXRhIHNob3dzIHRoZSB0aW1lIHNwZW50IGlu
IHRoZSBjbGVhci1kaXJ0eS1sb2cgcGhhc2UKPiAoaS5lLiwgdGhlIEtWTV9DTEVBUl9ESVJUWV9M
T0cgaW9jdGwpIHVuZGVyIGVhY2ggY29uZmlndXJhdGlvbi4KPgo+ICstLS0tLS0tLS0tLS0tLS0t
LS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwo+
IHwgV3JpdGUgUGVyY2VudGFnZSB8IE9yaWdpbmFsIChzKSAgICAgfCBQYXRjaGVkIChzKSAgICAg
IHwgSW1wcm92ZW1lbnQgfAo+ICstLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0t
Ky0tLS0tLS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwo+IHwgMTAlICAgICAgICAgICAgICB8
IDAuMDEyOTA1ICAgICAgICAgfCAwLjAwOTIxMyAgICAgICAgIHwgKzI4LjYlICAgICAgfAo+IHwg
MzAlICAgICAgICAgICAgICB8IDAuMDE0MjE3ICAgICAgICAgfCAwLjAxMDI4NyAgICAgICAgIHwg
KzI3LjYlICAgICAgfAo+IHwgNTAlICAgICAgICAgICAgICB8IDAuMDE0NjA2ICAgICAgICAgfCAw
LjAxMTc3MiAgICAgICAgIHwgKzE5LjQlICAgICAgfAo+IHwgNzAlICAgICAgICAgICAgICB8IDAu
MDE0NzM1ICAgICAgICAgfCAwLjAxMzE5OSAgICAgICAgIHwgKzEwLjQlICAgICAgfAo+IHwgMTAw
JSAgICAgICAgICAgICB8IDAuMDE0NzU5ICAgICAgICAgfCAwLjAxNTI5NCAgICAgICAgIHwgLTMu
NiUgICAgICAgfAo+ICstLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0t
LS0tLS0tLS0tLS0tLSstLS0tLS0tLS0tLS0tKwo+Cj4gVGhlIHBlcmZvcm1hbmNlIGltcHJvdmVt
ZW50IGlzIG1vc3Qgc2lnbmlmaWNhbnQgd2hlbiB0aGUgZGlydHkgbWFzayBpcwo+IHNwYXJzZSAo
bG93IHdyaXRlIHBlcmNlbnRhZ2UpLCB3aGljaCBpcyBjb21tb24gaW4gcmVhbC13b3JsZCBzY2Vu
YXJpb3MKPiB3aXRoIGxvdyB0byBtb2RlcmF0ZSBtZW1vcnkgd3JpdGUgaW50ZW5zaXR5LiBJbiB0
aGUgd29yc3QtY2FzZSBzY2VuYXJpbwo+IHdoZXJlIHRoZSBtYXNrIGlzIGZ1bGx5IHNldCAoMTAw
JSB3cml0ZSksIHRoZSBvcHRpbWl6YXRpb24gaW50cm9kdWNlcwo+IGEgc2xpZ2h0IDMuNiUgb3Zl
cmhlYWQgZHVlIHRvIHRoZSBhZGRpdGlvbmFsIGJpdCBvcGVyYXRpb25zLCB3aGljaCBpcwo+IGFj
Y2VwdGFibGUgZ2l2ZW4gdGhlIHN1YnN0YW50aWFsIGdhaW5zIGluIGNvbW1vbiBjYXNlcy4KPgo+
IFRoaXMgY2hhbmdlIHNpZ25pZmljYW50bHkgcmVkdWNlcyB0aGUgbnVtYmVyIG9mIHBhZ2UtdGFi
bGUgd2Fsa3Mgd2hlbgo+IHRoZSBkaXJ0eSBtYXNrIGhhcyBtYW55IHplcm8gYml0cywgaW1wcm92
aW5nIHRoZSBlZmZpY2llbmN5IG9mCj4gS1ZNX0NMRUFSX0RJUlRZX0xPRyBhbmQgcmVsYXRlZCBp
b2N0bHMuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFllY2hhbyA8d2FuZy55ZWNoYW8yNTVAenRl
LmNvbS5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KClF1ZXVlZCB0aGlzIHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKCj4g
LS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIHwgIDMgKysKPiAgYXJj
aC9yaXNjdi9rdm0vZ3N0YWdlLmMgICAgICAgICAgICAgfCA1OSArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS9tbXUuYyAgICAgICAgICAgICAgICB8ICAyICst
Cj4gIDMgZmlsZXMgY2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIGIvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS9rdm1fZ3N0YWdlLmgKPiBpbmRleCAyMWUyMDE5ZGYwY2YuLjUwYzc0
NTI3ZGRkMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2Uu
aAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gQEAgLTgyLDYg
KzgyLDkgQEAgYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3VubWFwX3JhbmdlKHN0cnVjdCBrdm1fZ3N0
YWdlICpnc3RhZ2UsCj4KPiAgYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3JhbmdlKHN0cnVjdCBr
dm1fZ3N0YWdlICpnc3RhZ2UsIGdwYV90IHN0YXJ0LCBncGFfdCBlbmQpOwo+Cj4gK2Jvb2wga3Zt
X3Jpc2N2X2dzdGFnZV93cF9wdF9tYXNrZWQoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ2Zu
X3QgYmFzZV9nZm4sCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25l
ZCBsb25nIG1hc2spOwo+ICsKPiAgdm9pZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZv
aWQpOwo+Cj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBrdm1fcmlzY3ZfZ3N0YWdlX21v
ZGUodW5zaWduZWQgbG9uZyBwZ2RfbGV2ZWxzKQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2
bS9nc3RhZ2UuYyBiL2FyY2gvcmlzY3Yva3ZtL2dzdGFnZS5jCj4gaW5kZXggYzRjM2I3OTU2N2Yx
Li45YWY4NmIxYzVlM2MgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2UuYwo+IEBAIC00NzIsNiArNDcyLDY1IEBAIGJvb2wg
a3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZShzdHJ1Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBncGFf
dCBzdGFydCwgZ3BhX3QgZW5kCj4gICAgICAgICByZXR1cm4gZmx1c2g7Cj4gIH0KPgo+ICtzdGF0
aWMgaW5saW5lIHZvaWQgY2xlYXJfaHVnZV9tYXNrKHVuc2lnbmVkIGxvbmcgKm1hc2ssIHVuc2ln
bmVkIGxvbmcgcGFnZV9zaXplLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z2ZuX3QgYmFzZV9nZm4sIGdwYV90IGFkZHIpCj4gK3sKPiArICAgICAgIHVuc2lnbmVkIGxvbmcg
c3RhcnRfaW5kZXggPSAwOwo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBlbmRfaW5kZXggPSBCSVRT
X1BFUl9MT05HIC0gMTsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgZW5kX2dmbiA9IGJhc2VfZ2Zu
ICsgZW5kX2luZGV4Owo+ICsgICAgICAgdW5zaWduZWQgbG9uZyBhbGlnbmVkX3N0YXJ0X2dmbiA9
IGFkZHIgPj4gUEFHRV9TSElGVDsKPiArICAgICAgIHVuc2lnbmVkIGxvbmcgYWxpZ25lZF9lbmRf
Z2ZuID0gYWxpZ25lZF9zdGFydF9nZm4gKyAocGFnZV9zaXplID4+IFBBR0VfU0hJRlQpIC0gMTsK
PiArICAgICAgIHVuc2lnbmVkIGludCBuYml0cyA9IDA7Cj4gKwo+ICsgICAgICAgaWYgKGFsaWdu
ZWRfc3RhcnRfZ2ZuID4gYmFzZV9nZm4pCj4gKyAgICAgICAgICAgICAgIHN0YXJ0X2luZGV4ID0g
YWxpZ25lZF9zdGFydF9nZm4gLSBiYXNlX2dmbjsKPiArCj4gKyAgICAgICBpZiAoYWxpZ25lZF9l
bmRfZ2ZuIDwgZW5kX2dmbikKPiArICAgICAgICAgICAgICAgZW5kX2luZGV4ID0gYWxpZ25lZF9l
bmRfZ2ZuIC0gYmFzZV9nZm47Cj4gKwo+ICsgICAgICAgbmJpdHMgPSBlbmRfaW5kZXggLSBzdGFy
dF9pbmRleCArIDE7Cj4gKyAgICAgICBiaXRtYXBfY2xlYXIobWFzaywgc3RhcnRfaW5kZXgsIG5i
aXRzKTsKPiArfQo+ICsKPiArYm9vbCBrdm1fcmlzY3ZfZ3N0YWdlX3dwX3B0X21hc2tlZChzdHJ1
Y3Qga3ZtX2dzdGFnZSAqZ3N0YWdlLCBnZm5fdCBiYXNlX2dmbiwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbWFzaykKPiArewo+ICsgICAgICAgdW5z
aWduZWQgbG9uZyBwYWdlX3NpemU7Cj4gKyAgICAgICBib29sIGZsdXNoID0gZmFsc2U7Cj4gKyAg
ICAgICBib29sIGZvdW5kX2xlYWY7Cj4gKyAgICAgICB1MzIgcHRlcF9sZXZlbDsKPiArICAgICAg
IHB0ZV90ICpwdGVwOwo+ICsgICAgICAgZ3BhX3QgYWRkciA9IDA7Cj4gKyAgICAgICBpbnQgcmV0
Owo+ICsKPiArICAgICAgIHdoaWxlIChtYXNrKSB7Cj4gKyAgICAgICAgICAgICAgIGFkZHIgPSAo
YmFzZV9nZm4gKyBfX2ZmcyhtYXNrKSkgPDwgUEFHRV9TSElGVDsKPiArCj4gKyAgICAgICAgICAg
ICAgIGZvdW5kX2xlYWYgPSBrdm1fcmlzY3ZfZ3N0YWdlX2dldF9sZWFmKGdzdGFnZSwgYWRkciwg
JnB0ZXAsICZwdGVwX2xldmVsKTsKPiArICAgICAgICAgICAgICAgcmV0ID0gZ3N0YWdlX2xldmVs
X3RvX3BhZ2Vfc2l6ZShnc3RhZ2UsIHB0ZXBfbGV2ZWwsICZwYWdlX3NpemUpOwo+ICsgICAgICAg
ICAgICAgICBpZiAocmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsKPiAr
ICAgICAgICAgICAgICAgaWYgKGZvdW5kX2xlYWYpIHsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAocHRlcF9sZXZlbCkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYWRk
ciA9IEFMSUdOX0RPV04oYWRkciwgcGFnZV9zaXplKTsKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIGNsZWFyX2h1Z2VfbWFzaygmbWFzaywgcGFnZV9zaXplLCBiYXNlX2dmbiwgYWRk
cik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBmbHVzaCB8PSBrdm1fcmlzY3ZfZ3N0YWdlX29wX3B0ZShnc3RhZ2UsIGFkZHIsIHB0ZXAs
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgcHRlcF9sZXZlbCwgR1NUQUdFX09QX1dQKTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgaWYgKHB0ZXBfbGV2ZWwpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250
aW51ZTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiArICAgICAgICAgICAgICAgLyogY2xlYXIg
dGhlIGZpcnN0IHNldCBiaXQqLwo+ICsgICAgICAgICAgICAgICBtYXNrICY9IG1hc2sgLSAxOwo+
ICsgICAgICAgfQo+ICsKPiArICAgICAgIHJldHVybiBmbHVzaDsKPiArfQo+ICsKPiAgdm9pZCBf
X2luaXQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKQo+ICB7Cj4gICNpZmRlZiBD
T05GSUdfNjRCSVQKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vbW11LmMgYi9hcmNoL3Jp
c2N2L2t2bS9tbXUuYwo+IGluZGV4IDA4MmY5YjI2MTczMy4uN2VhYjU4ZmY2M2Y5IDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vbW11LmMK
PiBAQCAtMTEwLDcgKzExMCw3IEBAIHZvaWQga3ZtX2FyY2hfbW11X2VuYWJsZV9sb2dfZGlydHlf
cHRfbWFza2VkKHN0cnVjdCBrdm0gKmt2bSwKPgo+ICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9p
bml0KCZnc3RhZ2UsIGt2bSk7Cj4KPiAtICAgICAgIGZsdXNoID0ga3ZtX3Jpc2N2X2dzdGFnZV93
cF9yYW5nZSgmZ3N0YWdlLCBzdGFydCwgZW5kKTsKPiArICAgICAgIGZsdXNoID0ga3ZtX3Jpc2N2
X2dzdGFnZV93cF9wdF9tYXNrZWQoJmdzdGFnZSwgYmFzZV9nZm4sIG1hc2spOwo+ICAgICAgICAg
aWYgKGZsdXNoKQo+ICAgICAgICAgICAgICAgICBrdm1fZmx1c2hfcmVtb3RlX3RsYnNfcmFuZ2Uo
a3ZtLCBzdGFydCA+PiBQQUdFX1NISUZULAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgKGVuZCAtIHN0YXJ0KSA+PiBQQUdFX1NISUZUKTsKPiAtLQo+IDIuMjcu
MAo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
