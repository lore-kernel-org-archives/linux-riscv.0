Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD630D78770
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 18:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qjO3o3+uCq7X0LPTU+ZK0fpZ+YYr1bhlh2M0/QYc6Es=; b=vlydcYeZv+SFKL
	c6GwqxUm+S00BytGC4QNDNAB+NJXyAiTxoLyT/mBJnuqyLQfw2bmGUhVIEipYjXun5OxFuDVUUkLr
	T1cvZCwV/+Iu7B7ntKuU9AHXTfbg2FAjAiry+V0QSHayHWO1tQz3DNFzAFY4E0xoNISZTqgTxBPEO
	QvrgEaewI6CwCbaPMphYuLK1Lk4UEyWeordmOwPx0Wr5O53qZpeZFulT8Rd5+yIeraCtorSMTBj4v
	eKAk9sbzvYU30O8yX9t+zmJIYXGVlkvMs0BXAoXh4/WMrEnIhh7Ke6VppQ4IdZA701A5GWMzjX8UE
	irjqr26gLU1K4qNkjyqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWesP-0000000AkZs-1sC6;
	Fri, 19 Dec 2025 18:06:53 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWesM-0000000AkZV-3uAx
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 18:06:52 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-34c363eb612so1976836a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Dec 2025 10:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766167610; x=1766772410; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qosZakFhYdG6X2ZBYTzKS7NaacVY3QraRYdC9vadgS0=;
        b=VhCxv+ABqyY2rU6kUKVX9LCu48zY+HL1sWVspR3jXRNbRIShf3+WCULVQmFpig06kI
         s+IGChYBpHWz8rUyI/fJtDNIoHN2JHv3U/YLyAVFN9qWe+/uXxr+LFsydahmVYKthzJ0
         cZCicvhP9m7VnZlX3yK7Mc5Y6SW2pdUX7ACfz13CFZ03kGvMjxIz72TaBJGl1n/5foAS
         nC6aivlKUzCCcqbML5D2N/7AuEOZJD3faoowfCUWY4CJmuY/GlzR3veLI6dXF2X/g9P5
         wyw8PiTDA39tJvtd9ku2Hijqtfw+RuedYlYdNIU/5sk+JnxQV388NkBYGtV6NRQeLHcm
         pvCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766167610; x=1766772410;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qosZakFhYdG6X2ZBYTzKS7NaacVY3QraRYdC9vadgS0=;
        b=aYs6JLJ5BCpsYYCdDIOscatcwQMEUvpnTBqhoN2zl5StevKC32qI2iGczsiypF0wST
         nWiZG6wefQbZc/rQawGF4lfrYHQNnIYvPY+LyJ5heNzcbUYqvt55+Rs906Twm1DJxc8g
         bvBP2OmDHNlgWUtsbtzCWLjv1Kz+6TVhgqIihfEi0aaDoi76vG1skHh8D+S77GcxpfQ8
         hyWvSjrYrFvIdKbmtqfd4jDWioW7AHVzjhGUGjzsT8IRZ0VeXTjeKddAnYP+DDuO2t3I
         FpeNViu8+ygLHdXl8jDGfWlWdOUNghvzuAcuEnhAsEUXQ+l0bpZBJgxPSdcSQsalTTqY
         Pl6A==
X-Forwarded-Encrypted: i=1; AJvYcCXTDktb7yENz/Gf9MoeR9o158W1pwfqP+Nt30JZtUxyxReHapO6WNHCXyg6SoUcx/p0emfPOjsOWGT7xw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5Y2RzQQMCp9tQ/exSe5tKEYc/9rlnYFvPViU/VP7QeMR06aMV
	XifFhJhw2A9+gREqQV1zZeC6Iw/epAkm0OdLr5Uum7LoE6YwTsRJd5Il7uaDLtfNa05d28Qee40
	2vvyC8CWYXWJsotd3n9jQDHzetohYnvE=
X-Gm-Gg: AY/fxX5blajPO2q5CFaCy7HfTsjO9UuFmXYSh3mUsNS2aAWugYo+yP1Ic1jRN1XfWoW
	UBU2CB3Q7F/QfYM52r0lKmBJNfOu7przUAwE9F2sooBr9z997saysMjJ/GFSa595cmWQ+JAZbbr
	OVrB7CDciXtkiRhimkrLcNPJlAV33eE5dH2XYpc9pCnYnoSNuEwVFh893ByM8FGcVrvplUhtvU5
	EC/kSO9q1rOJUpjDr/+IlJjm4c2FQiKONjJ+rqm/efZ+8Qe/KtReiIcoYcAlRUcJ5Ka/Cq/Zlw4
	wXcpkQ==
X-Google-Smtp-Source: AGHT+IELkvg9hwjjD1NgKcyOGFac7K1VtSkXFLfkRXFpfI1tYbR+cyHadC0UQJGbH/ohsYwpBSb27DvI3ZXGvLSDXXE=
X-Received: by 2002:a17:90b:4a52:b0:343:6611:f21 with SMTP id
 98e67ed59e1d1-34e92137b5dmr3035036a91.1.1766167609589; Fri, 19 Dec 2025
 10:06:49 -0800 (PST)
MIME-Version: 1.0
References: <20251219124748.81133-1-dongml2@chinatelecom.cn>
In-Reply-To: <20251219124748.81133-1-dongml2@chinatelecom.cn>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Fri, 19 Dec 2025 10:06:37 -0800
X-Gm-Features: AQt7F2pzdwWAbVPseLvzkmUY4U2obagqdu1hJJyWZS-asVbN3Dd2foRZZL3Djcc
Message-ID: <CAEf4BzZBoHvB0yY740zyZWYKAgCeTXjLvfJUebq5FRWmq=WBZA@mail.gmail.com>
Subject: Re: [PATCH bpf] riscv, bpf: fix incorrect usage of BPF_TRAMP_F_ORIG_STACK
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org, 
	martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org, 
	yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org, 
	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, bjorn@kernel.org, 
	pulehui@huawei.com, puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, jiang.biao@linux.dev, 
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_100650_975288_8F7D4307 
X-CRM114-Status: GOOD (  17.82  )
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

T24gRnJpLCBEZWMgMTksIDIwMjUgYXQgNjo0M+KAr0FNIE1lbmdsb25nIERvbmcgPG1lbmdsb25n
OC5kb25nQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgdXNhZ2Ugb2YgQlBGX1RSQU1QX0ZfT1JJ
R19TVEFDSyBpbiBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZSgpIGlzCj4gd3JvbmcsIGFu
ZCBpdCBzaG91bGQgYmUgQlBGX1RSQU1QX0ZfQ0FMTF9PUklHLCB3aGljaCBjYXVzZWQgY3Jhc2gg
YXMKPiBBbmRyZWFzIHJlcG9ydGVkOgo+Cj4gICBJbnN1ZmZpY2llbnQgc3RhY2sgc3BhY2UgdG8g
aGFuZGxlIGV4Y2VwdGlvbiEKPiAgIFRhc2sgc3RhY2s6ICAgICBbMHhmZjIwMDAwMDAwMDEwMDAw
Li4weGZmMjAwMDAwMDAwMTQwMDBdCj4gICBPdmVyZmxvdyBzdGFjazogWzB4ZmY2MDAwMDBmZmRh
ZDA3MC4uMHhmZjYwMDAwMGZmZGFlMDcwXQo+ICAgQ1BVOiAxIFVJRDogMCBQSUQ6IDEgQ29tbTog
c3lzdGVtZCBOb3QgdGFpbnRlZCA2LjE4LjAtcmM1KyAjMTUgUFJFRU1QVCh2b2x1bnRhcnkpCj4g
ICBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8gcWVtdS9xZW11LCBCSU9TIDIwMjUuMTAgMTAv
MDEvMjAyNQo+ICAgZXBjIDogY29weV9mcm9tX2tlcm5lbF9ub2ZhdWx0KzB4YS8weDE5OAo+ICAg
IHJhIDogYnBmX3Byb2JlX3JlYWRfa2VybmVsKzB4MjAvMHg2MAo+ICAgZXBjIDogZmZmZmZmZmY4
MDJiNzMyYSByYSA6IGZmZmZmZmZmODAxZTYwNzAgc3AgOiBmZjIwMDAwMDAwMDBmZmUwCj4gICAg
Z3AgOiBmZmZmZmZmZjgyMjYyZWQwIHRwIDogMDAwMDAwMDAwMDAwMDAwMCB0MCA6IGZmZmZmZmZm
ODAwMjIzMjAKPiAgICB0MSA6IGZmZmZmZmZmODAxZTYwNTYgdDIgOiAwMDAwMDAwMDAwMDAwMDAw
IHMwIDogZmYyMDAwMDAwMDAxMDA0MAo+ICAgIHMxIDogMDAwMDAwMDAwMDAwMDAwOCBhMCA6IGZm
MjAwMDAwMDAwMTAwNTAgYTEgOiBmZjYwMDAwMDgzYjNkMzIwCj4gICAgYTIgOiAwMDAwMDAwMDAw
MDAwMDA4IGEzIDogMDAwMDAwMDAwMDAwMDA5NyBhNCA6IDAwMDAwMDAwMDAwMDAwMDAKPiAgICBh
NSA6IDAwMDAwMDAwMDAwMDAwMDAgYTYgOiAwMDAwMDAwMDAwMDAwMDIxIGE3IDogMDAwMDAwMDAw
MDAwMDAwMwo+ICAgIHMyIDogZmYyMDAwMDAwMDAxMDA1MCBzMyA6IGZmNjAwMDAwODQ1OWZjMTgg
czQgOiBmZjYwMDAwMDgzYjNkMzQwCj4gICAgczUgOiBmZjIwMDAwMDAwMDEwMDYwIHM2IDogMDAw
MDAwMDAwMDAwMDAwMCBzNyA6IGZmMjAwMDAwMDAwMTNhYTgKPiAgICBzOCA6IDAwMDAwMDAwMDAw
MDAwMDAgczkgOiAwMDAwMDAwMDAwMDA4MDAwIHMxMDogMDAwMDAwMDAwMDU4ZGNiMAo+ICAgIHMx
MTogMDAwMDAwMDAwMDU4ZGNhNyB0MyA6IDAwMDAwMDAwNjkyNTExNmQgdDQgOiBmZjYwMDAwMDgw
OTBmMDI2Cj4gICAgdDUgOiAwMDAwN2ZmZjliMGNiYWE4IHQ2IDogMDAwMDAwMDAwMDAwMDAxNgo+
ICAgc3RhdHVzOiAwMDAwMDAwMjAwMDAwMTIwIGJhZGFkZHI6IDAwMDAwMDAwMDAwMDAwMDAgY2F1
c2U6IDgwMDAwMDAwMDAwMDAwMDUKPiAgIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBLZXJu
ZWwgc3RhY2sgb3ZlcmZsb3cKPiAgIENQVTogMSBVSUQ6IDAgUElEOiAxIENvbW06IHN5c3RlbWQg
Tm90IHRhaW50ZWQgNi4xOC4wLXJjNSsgIzE1IFBSRUVNUFQodm9sdW50YXJ5KQo+ICAgSGFyZHdh
cmUgbmFtZTogcmlzY3YtdmlydGlvIHFlbXUvcWVtdSwgQklPUyAyMDI1LjEwIDEwLzAxLzIwMjUK
PiAgIENhbGwgVHJhY2U6Cj4gICBbPGZmZmZmZmZmODAwMWExZjg+XSBkdW1wX2JhY2t0cmFjZSsw
eDI4LzB4MzgKPiAgIFs8ZmZmZmZmZmY4MDAwMjUwMj5dIHNob3dfc3RhY2srMHgzYS8weDUwCj4g
ICBbPGZmZmZmZmZmODAwMTIyYmU+XSBkdW1wX3N0YWNrX2x2bCsweDU2LzB4ODAKPiAgIFs8ZmZm
ZmZmZmY4MDAxMjMwMD5dIGR1bXBfc3RhY2srMHgxOC8weDIyCj4gICBbPGZmZmZmZmZmODAwMDJh
YmU+XSB2cGFuaWMrMHhmNi8weDMyOAo+ICAgWzxmZmZmZmZmZjgwMDAyZDJlPl0gcGFuaWMrMHgz
ZS8weDQwCj4gICBbPGZmZmZmZmZmODAwMTllZjA+XSBoYW5kbGVfYmFkX3N0YWNrKzB4OTgvMHhh
MAo+ICAgWzxmZmZmZmZmZjgwMWU2MDcwPl0gYnBmX3Byb2JlX3JlYWRfa2VybmVsKzB4MjAvMHg2
MAo+Cj4gSnVzdCBmaXggaXQuCj4KPiBGaXhlczogNDdjOTIxNGRjYmVhICgiYnBmOiBmaXggdGhl
IHVzYWdlIG9mIEJQRl9UUkFNUF9GX1NLSVBfRlJBTUUiKQo+IFJlcG9ydGVkLWJ5OiBBbmRyZWFz
IFNjaHdhYiA8c2Nod2FiQGxpbnV4LW02OGsub3JnPgo+IENsb3NlczogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvYnBmLzg3NGlwbmtmdnQuZnNmQGlnZWwuaG9tZS8KPiBTaWduZWQtb2ZmLWJ5OiBN
ZW5nbG9uZyBEb25nIDxkb25nbWwyQGNoaW5hdGVsZWNvbS5jbj4KPiAtLS0KPiAgYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBm
X2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBpbmRleCA1
Zjk0NTdlOTEwZTguLjA5YjcwYmYzNjJkMyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L25ldC9i
cGZfaml0X2NvbXA2NC5jCj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+
IEBAIC0xMTM0LDcgKzExMzQsNyBAQCBzdGF0aWMgaW50IF9fYXJjaF9wcmVwYXJlX2JwZl90cmFt
cG9saW5lKHN0cnVjdCBicGZfdHJhbXBfaW1hZ2UgKmltLAo+ICAgICAgICAgc3RvcmVfYXJncyhu
cl9hcmdfc2xvdHMsIGFyZ3Nfb2ZmLCBjdHgpOwo+Cj4gICAgICAgICAvKiBza2lwIHRvIGFjdHVh
bCBib2R5IG9mIHRyYWNlZCBmdW5jdGlvbiAqLwo+IC0gICAgICAgaWYgKGZsYWdzICYgQlBGX1RS
QU1QX0ZfT1JJR19TVEFDSykKPiArICAgICAgIGlmIChmbGFncyAmIEJQRl9UUkFNUF9GX0NBTExf
T1JJRykKPiAgICAgICAgICAgICAgICAgb3JpZ19jYWxsICs9IFJWX0ZFTlRSWV9OSU5TTlMgKiA0
Owo+Cj4gICAgICAgICBpZiAoZmxhZ3MgJiBCUEZfVFJBTVBfRl9DQUxMX09SSUcpIHsKCm1vdmUg
b3JpZ19jYWxsIGhlcmUsIGl0J3MgdGhlIHNhbWUgZmxhZ3MgJiBCUEZfVFJBTVBfRl9DQUxMX09S
SUcgY2hlY2ssIG5vPwoKPiAtLQo+IDIuNTIuMAo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
