Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BF2CC369CB
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 05:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vsk7sfbSnCO5p8nKDrPlAsTGDR8xOvO6gZm5G/22bmo=; b=eWVs6C3knRWnKU
	IxhUyUBTF8KIpMgCAdziuzHFbfZIWyDnnEIo3BERgUOvtd+YCr6Q7AELo6kJqzNf43Ogzs3Hm++gG
	erQb3pDBZPEupzIsQFuCHoqdh1xYnfhccwrQnu6RQAC8TS9ih2RdocA9SlKOxQTAEW9s1L+cvJ0Lj
	91C27Z887ga8EWvPQACRHD3P2wBODfXG78IHimYLPE3258MZYH1CgOJThsEobhdkMjp80q/RvscdV
	l26wq1c+Ub/0o4C8IxittsLLwtyDKpvCz8tlBxVGUtEa1qT+iAUCQaiIJHw3AIEvtSB+FFqDXWxuS
	V3kK0TmyfLgcTwKP2/AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dyY-00000008SP9-0COl;
	Tue, 29 Apr 2025 05:57:50 +0000
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9dyV-00000008SNn-26EQ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 05:57:48 +0000
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-52617ceae0dso1672268e0c.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Apr 2025 22:57:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1745906266; x=1746511066; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ddti0n2S/jg8OKWHEcLbUee9AuMJvWjvjNHUetZZSfw=;
        b=Lfhcj8z1VKINoKSL7N4+PVlnlcPRC2f854V7lrmVS7cWUVXnuuGHR8itYDLjvajEyJ
         BUdgcCUFGGNwUKfqEhhPIhqZZSwLE+/tTZ1CxpTLcxaKh4e3J9fICbCbacrfijvfArf9
         oTbWwOIVAt8mzaw6Xz/NPUr6rFoLGGD/zs2tPqqbu9qOnjiazsW6tLlteJij65oCG/FA
         H5ih3fmIETjXxIKTMe1amsf3kwNPJqZ50lOsmYFrPenGNQTlI23SBZuSSqyzBVvumUNW
         Pi7arTH1kDjBUDh1nUu8nsunifLNYmnYshW3+EwP5bch7hLPh8XARc6h6WudwfKwF7LM
         ZmUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906266; x=1746511066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ddti0n2S/jg8OKWHEcLbUee9AuMJvWjvjNHUetZZSfw=;
        b=IZvcBH1+ie+VmocfqZMJXNMo50X+6OHIAWp6Dy5GtT57aRuq8E0eEkUxXQ3M6qDKiW
         pm0eG6O03mWzLFiUQMkGyBuQEtC4AsG4M/1tYr+RSdD03v1LdZUSD1dc3ajpB/mvG8Wj
         I2ANbMgZflW4ftRUwfyNC2itdyYx+xIUxsAeyxjjplQy/i0cFBz+TYMyNSoBdrk4GljH
         Gj8WXOtvxd/MSL6rhwwpFzjRtfkFn2/4fwhexMO0p7IUXhcOMQhPtYSgSPju/MH28x/v
         5IN6cOmjAMzdS2FmD5vZIfb/UTRZBPPAkQ/4pk8cRENeO77oY5iPZ4OEyGxa0FN2Pszx
         GqsQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6iHYfehwKSndRODBEvGU7rB08M9E/Lmg6taosblAjaCPoFhAAQ0rM/SQCk30cRmaw38zQhZTMdBfZ4Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBuVRvlNjGlS6dxvC6IpVjXIyfiNvSBBUCFGZRXESOf0HWx1iQ
	uSuYVEy1CYwc51FuL0CEBnjmRcpblG+/Ouu/AirS9E0UwtgNTN/+sZ4J4gVinNfBrwyiSnRywH4
	B1WscvunmdCRH/3Y+DtpOQ0+uU2YCSP2fXKJaGw==
X-Gm-Gg: ASbGncuIzPeRUL4y91xt9DEo/ILEOkd393gSvFuq8sH2BUMA9S9/yP6PFScR6yi7xbf
	5EnBSOxEXcdqJ+Dqw+cVQB/2Me+ubdYm21LHWZZ8uMIGXg/DF8qAv451kn4jib23swjBsixIPTB
	qa2oMafAD08cAhJcWyi0eWw409ilHXly6A
X-Google-Smtp-Source: AGHT+IEn/oEoK2xnjuBCKAEyj5Yho5ISKK7oYum7pkkABBkOq83roFDelFUJbx9DNm+6+i9//ldDZwxd9vW6Vmp0QlI=
X-Received: by 2002:a05:6102:15a3:b0:4c4:f128:3acf with SMTP id
 ada2fe7eead31-4d641f63966mr7068795137.16.1745906266057; Mon, 28 Apr 2025
 22:57:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250411073850.3699180-1-nylon.chen@sifive.com>
 <20250411073850.3699180-3-nylon.chen@sifive.com> <992e3135-0c55-403c-9f71-d76c59cec75b@rivosinc.com>
 <22a2c734-b446-4b1e-a2bc-a0080656fe29@ghiti.fr> <f4be063b-f321-45d4-9891-b50f30beb1ef@rivosinc.com>
In-Reply-To: <f4be063b-f321-45d4-9891-b50f30beb1ef@rivosinc.com>
From: Nylon Chen <nylon.chen@sifive.com>
Date: Tue, 29 Apr 2025 13:57:35 +0800
X-Gm-Features: ATxdqUE3DFeyNUfNMa05FUInNcAHiDlHwf0FR6F-MXEQ4WqvB3Vh02exsh8mq4c
Message-ID: <CAHh=Yk-jk-KzDK_kJTbGi8HOZqsUPZjdGN8eF_op=HKF2V-Udw@mail.gmail.com>
Subject: Re: [PATCH 2/2] riscv: misaligned: fix sleeping function called
 during misaligned access handling
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, charlie@rivosinc.com, jesse@rivosinc.com, 
	evan@rivosinc.com, zhangchunyan@iscas.ac.cn, samuel.holland@sifive.com, 
	zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_225747_564272_F34B42CC 
X-CRM114-Status: GOOD (  22.85  )
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

SGkgQ2zDqW1lbnQsCgpUaGFuayB5b3UgZm9yIHNoYXJpbmcgeW91ciBwYXRjaC4gSeKAmXZlIHJl
dmlld2VkIHRoZSBjaGFuZ2VzLCBidXQgSeKAmW0Kbm90IHN1cmUgSSBmdWxseSBncmFzcCB0aGUg
ZGVzaWduIHJhdGlvbmFsZS4KQ291bGQgeW91IHBsZWFzZSBicmllZmx5IGV4cGxhaW4gdGhlIG1h
aW4gY29uc2lkZXJhdGlvbnMgYmVoaW5kIHRoaXMKbW9kaWZpY2F0aW9uPwoKV2XigJlyZSBhbHNv
IGRpc2N1c3NpbmcgaW50ZXJuYWxseSB0aGUgZGlmZmVyZW5jZXMgYmV0d2VlbiBteSBfbm9mYXVs
dAphcHByb2FjaCBhbmQgeW91ciBJUlEtZW5hYmxlIGFwcHJvYWNoLCBhbmQgSeKAmWQgYXBwcmVj
aWF0ZSB5b3VyCnBlcnNwZWN0aXZlIG9uIHRoZSBwcm9zIGFuZCBjb25zIG9mIGVhY2guCgpMb29r
aW5nIGZvcndhcmQgdG8geW91ciBzdWdnZXN0aW9ucyEKCk55bG9uCgpDbMOpbWVudCBMw6lnZXIg
PGNsZWdlckByaXZvc2luYy5jb20+IOaWvCAyMDI15bm0NOaciDEx5pelIOmAseS6lCDkuIvljYg0
OjM45a+r6YGT77yaCj4KPgo+Cj4gT24gMTEvMDQvMjAyNSAxMDozNSwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+ID4gSGkgQ2zDqW1lbnQsCj4gPgo+ID4gT24gMTEvMDQvMjAyNSAwOTozNiwgQ2zD
qW1lbnQgTMOpZ2VyIHdyb3RlOgo+ID4+IEhpIE55bG9uLAo+ID4+Cj4gPj4gSSBhbHJlYWR5IGhh
dmUgYSBwZW5kaW5nIGZpeCBmb3IgdGhhdCBidWcgd2hpY2ggaXMgdG8gcmVlbmFibGUKPiA+PiBp
bnRlcnJ1cHRzIHdoaWxlIGhhbmRsaW5nIG1pc2FsaWduZWQgZmF1bHRzLiBQbGVhc2Ugc2VlOgo+
ID4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjUwMzE3MTcwNjI1LjEx
NDI4NzAtMTItCj4gPj4gY2xlZ2VyQHJpdm9zaW5jLmNvbS8KPiA+Cj4gPgo+ID4gQ2FuIHlvdSBl
eHRyYWN0IHRoaXMgZml4IGZyb20gdGhlIHNlcmllcyBzbyB0aGF0IGl0IGNhbiBiZSBtZXJnZWQg
aW4gNi4xNT8KPgo+IEhpIEFsZXgsCj4KPiBZZXMgc3VyZSwgSSBjYW4gc2VuZCBhIHNtYWxsIHNl
cmllcyBhcyB3ZWxsLiBIb3dldmVyLCBJJ2QgbGlrZSB0aGUKPiBhc3NvY2lhdGVkIGtzZWxmdGVz
dCB0byBiZSByZXZpZXdlZCBzaW5jZSBpdCB3b3VsZCBhbGxvdyB0byBjYXRjaCBzdWNoCj4gYmVo
YXZpb3IgKHRoZXJlIGlzIG5vIHRlc3QgZm9yIG1pc2FsaWduZWQgZGVsZWdhdGlvbiB5ZXQpLgo+
Cj4gVGhhbmtzLAo+Cj4gQ2zDqW1lbnQKPgo+ID4KPiA+IFRoYW5rcywKPiA+Cj4gPiBBbGV4Cj4g
Pgo+ID4KPiA+Pgo+ID4+IFRoYW5rcywKPiA+Pgo+ID4+IENsw6ltZW50Cj4gPj4KPiA+PiBPbiAx
MS8wNC8yMDI1IDA5OjM4LCBOeWxvbiBDaGVuIHdyb3RlOgo+ID4+PiBVc2UgY29weV9mcm9tX3Vz
ZXJfbm9mYXVsdCgpIGFuZCBjb3B5X3RvX3VzZXJfbm9mYXVsdCgpIGluc3RlYWQgb2YKPiA+Pj4g
Y29weV9mcm9tL3RvX3VzZXIgZnVuY3Rpb25zIGluIHRoZSBtaXNhbGlnbmVkIGFjY2VzcyB0cmFw
IGhhbmRsZXJzLgo+ID4+Pgo+ID4+PiBUaGUgZm9sbG93aW5nIGJ1ZyByZXBvcnQgd2FzIGZvdW5k
IHdoZW4gZXhlY3V0aW5nIG1pc2FsaWduZWQgbWVtb3J5Cj4gPj4+IGFjY2Vzc2VzOgo+ID4+Pgo+
ID4+PiBCVUc6IHNsZWVwaW5nIGZ1bmN0aW9uIGNhbGxlZCBmcm9tIGludmFsaWQgY29udGV4dCBh
dCAuL2luY2x1ZGUvCj4gPj4+IGxpbnV4L3VhY2Nlc3MuaDoxNjIKPiA+Pj4gaW5fYXRvbWljKCk6
IDAsIGlycXNfZGlzYWJsZWQoKTogMSwgbm9uX2Jsb2NrOiAwLCBwaWQ6IDExNSwgbmFtZTogdHdv
Cj4gPj4+IHByZWVtcHRfY291bnQ6IDAsIGV4cGVjdGVkOiAwCj4gPj4+IENQVTogMCBVSUQ6IDAg
UElEOiAxMTUgQ29tbTogdHdvIE5vdCB0YWludGVkIDYuMTQuMC1yYzUgIzI0Cj4gPj4+IEhhcmR3
YXJlIG5hbWU6IHJpc2N2LXZpcnRpbyxxZW11IChEVCkKPiA+Pj4gQ2FsbCBUcmFjZToKPiA+Pj4g
ICBbPGZmZmZmZmZmODAwMTYwZWE+XSBkdW1wX2JhY2t0cmFjZSsweDFjLzB4MjQKPiA+Pj4gICBb
PGZmZmZmZmZmODAwMDIzMDQ+XSBzaG93X3N0YWNrKzB4MjgvMHgzNAo+ID4+PiAgIFs8ZmZmZmZm
ZmY4MDAxMGZhZT5dIGR1bXBfc3RhY2tfbHZsKzB4NGEvMHg2OAo+ID4+PiAgIFs8ZmZmZmZmZmY4
MDAxMGZlMD5dIGR1bXBfc3RhY2srMHgxNC8weDFjCj4gPj4+ICAgWzxmZmZmZmZmZjgwMDRlNDRl
Pl0gX19taWdodF9yZXNjaGVkKzB4ZmEvMHgxMDQKPiA+Pj4gICBbPGZmZmZmZmZmODAwNGU0OTY+
XSBfX21pZ2h0X3NsZWVwKzB4M2UvMHg2Mgo+ID4+PiAgIFs8ZmZmZmZmZmY4MDE5NjNjND5dIF9f
bWlnaHRfZmF1bHQrMHgxYy8weDI0Cj4gPj4+ICAgWzxmZmZmZmZmZjgwNDI1MzUyPl0gX2NvcHlf
ZnJvbV91c2VyKzB4MjgvMHhhYQo+ID4+PiAgIFs8ZmZmZmZmZmY4MDAwMjk2Yz5dIGhhbmRsZV9t
aXNhbGlnbmVkX3N0b3JlKzB4MjA0LzB4MjU0Cj4gPj4+ICAgWzxmZmZmZmZmZjgwOWVhZTgyPl0g
ZG9fdHJhcF9zdG9yZV9taXNhbGlnbmVkKzB4MjQvMHhlZQo+ID4+PiAgIFs8ZmZmZmZmZmY4MDlm
NGYxYT5dIGhhbmRsZV9leGNlcHRpb24rMHgxNDYvMHgxNTIKPiA+Pj4KPiA+Pj4gRml4ZXM6IGI2
ODZlY2RlYWNmNiAoInJpc2N2OiBtaXNhbGlnbmVkOiBSZXN0cmljdCB1c2VyIGFjY2VzcyB0bwo+
ID4+PiBrZXJuZWwgbWVtb3J5IikKPiA+Pj4gRml4ZXM6IDQ0MTM4MTUwNmJhNyAoInJpc2N2OiBt
aXNhbGlnbmVkOiByZW1vdmUgQ09ORklHX1JJU0NWX01fTU9ERQo+ID4+PiBzcGVjaWZpYyBjb2Rl
IikKPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogWm9uZyBMaSA8em9uZy5saUBzaWZpdmUuY29t
Pgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBOeWxvbiBDaGVuIDxueWxvbi5jaGVuQHNpZml2ZS5jb20+
Cj4gPj4+IC0tLQo+ID4+PiAgIGFyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYyB8
IDQgKystLQo+ID4+PiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19t
aXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2Lwo+ID4+PiBrZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5j
Cj4gPj4+IGluZGV4IGQ3Mjc1ZGZiNmI3ZS4uNTYzZjczZjg4ZmE4IDEwMDY0NAo+ID4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKPiA+Pj4gKysrIGIvYXJjaC9y
aXNjdi9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCj4gPj4+IEBAIC00NTUsNyArNDU1LDcgQEAg
c3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRfbG9hZChzdHJ1Y3QKPiA+Pj4gcHRf
cmVncyAqcmVncykKPiA+Pj4gICAgICAgICB2YWwuZGF0YV91NjQgPSAwOwo+ID4+PiAgICAgICBp
ZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4gPj4+IC0gICAgICAgIGlmIChjb3B5X2Zyb21fdXNlcigm
dmFsLCAodTggX191c2VyICopYWRkciwgbGVuKSkKPiA+Pj4gKyAgICAgICAgaWYgKGNvcHlfZnJv
bV91c2VyX25vZmF1bHQoJnZhbCwgKHU4IF9fdXNlciAqKWFkZHIsIGxlbikpCj4gPj4+ICAgICAg
ICAgICAgICAgcmV0dXJuIC0xOwo+ID4+PiAgICAgICB9IGVsc2Ugewo+ID4+PiAgICAgICAgICAg
bWVtY3B5KCZ2YWwsICh1OCAqKWFkZHIsIGxlbik7Cj4gPj4+IEBAIC01NTYsNyArNTU2LDcgQEAg
c3RhdGljIGludCBoYW5kbGVfc2NhbGFyX21pc2FsaWduZWRfc3RvcmUoc3RydWN0Cj4gPj4+IHB0
X3JlZ3MgKnJlZ3MpCj4gPj4+ICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPj4+ICAg
ICAgICAgaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+ID4+PiAtICAgICAgICBpZiAoY29weV90b191
c2VyKCh1OCBfX3VzZXIgKilhZGRyLCAmdmFsLCBsZW4pKQo+ID4+PiArICAgICAgICBpZiAoY29w
eV90b191c2VyX25vZmF1bHQoKHU4IF9fdXNlciAqKWFkZHIsICZ2YWwsIGxlbikpCj4gPj4+ICAg
ICAgICAgICAgICAgcmV0dXJuIC0xOwo+ID4+PiAgICAgICB9IGVsc2Ugewo+ID4+PiAgICAgICAg
ICAgbWVtY3B5KCh1OCAqKWFkZHIsICZ2YWwsIGxlbik7Cj4gPj4KPiA+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+IGxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdAo+ID4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiA+PiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
