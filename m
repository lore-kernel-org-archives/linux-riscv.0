Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B55FBCD4F52
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=srWfcPjel0Txodl/xJsjsN3tx+babu1cw+6EyIn2y24=; b=t8NT1S/mCy2bga
	td8fKsE8gRQXWGEy0CFVcC4M060ODcx7nc/g+l2CT0hEvOUSVp/I932xWU65nVMadXgFJ/k7YXnH6
	5UAd3t7y7LtuRfpVN5kiEpBBxGrhbgV4CgTd5+nXM2TTPfLtj/4oz6H3XTSn4D+Bm866d4t4OmCPW
	u67kWsUKzb3YtdoLzKaHqs8TbA3vaP/O9tv2rR753SgDhrf6kjtfwas+9BihyxxakhiTcHs5OYzOv
	hI0ljuNOCLgTNb/mf7x7fljFl6JVOXcxOKXnuuKJi4If8142VOh0/nnJ7ADBWUsqPlulSBmGT6Aau
	Ho2rk3ripbMqSqvJkIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwpk-0000000FaAV-1ySo;
	Mon, 18 May 2026 12:12:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwpj-0000000FaA8-0SLx
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 May 2026 12:12:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=; b=JwfmJP6MkwgveQ8IS48alCa43r
	xU3lD9y3Kvh2zryfqmjgyagYKGnEGOBVqwKNlH3wkfyNuqLO73WDOOxrVnk8grsba6LTqUJYF+CCU
	vXTUWM754H5vLi4kIW6QC3pgflV/9jl2lm67JyBTjBtLhhRUkzYcw0uKyvP9GZWqxkRnqTBNmRaas
	kzTORUYr9GIZeMda+CTF5E7Ht2l+E6Cu0iP/shu1Q1Tpp8t9Ajp6CaLgVcjwoHZPD0VTuX9nFs1yU
	hamKfNq1v+Ox5Y3//rKTDllmFPJWQqLhhVb8XMrEviE3VhJc1iC04KuVcuTQWykHjEHCLptG36zNy
	ZuLr43Nw==;
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwpf-0000000B5H6-3liG
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 12:12:29 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-40427db1300so1977216fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 05:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106346; cv=none;
        d=google.com; s=arc-20240605;
        b=QuhtLngITHhLzNGqLGhRWg1aO7r4sUGcy2e/+K3Z56CnN+/F6Aoha3x+xmtwW5hhuK
         lNBUxsS0dycvriDjkljte8q7uh3H5bv+KMHTsXPLlhQU8MSuzJTXraI4wmJXZwfcT8xk
         rEXdYnQ+xLx3b4tuUBRS6Q6rAFNpcC5F53UfZlGyHIJLFfImX5//+JQoIhPpfUSYTnX8
         AVcjzKvLwEYXYmCHGlFZKNGQcm23Un2kEwiRtTvs8xkB00TwCI/6zbRqdsu0rAjR/7o6
         0Mib4+cf6HnsEjfiKexhHrG+g9uRWRXHrcRlXT/DsSkYiqs1ZkY6b9JBlW759MLCjyrX
         JlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        fh=sirJ4OOswQ3qI/sGJyHu01q5YgM/A0njhFxHOSxzbO8=;
        b=A6ahGW93F+iDqXrZkh/lyQbTdB+ZrOaIFoFu2kbEppnmPZ9GBhfj5vTPQ1XZ/s8GN6
         Gnoo0yBexyPtdSmLTZNmgWVynsUgrRkSmkwO9qol0I++kEVE35SU2zU4GjtCbm1NFQzz
         F3zluQMOtVnwga98gV6yXH/HIU54xxeASH9++5efzVWPqgte4OuZFpP+oYO6gXeB+uLU
         NOz7Dzakugsv1pPFW1cfxn5QsOy9A4Q6/MXnr7X7tW+vf+RfiGPBjRgh8A3vniKqiHcW
         VWva2sUxJc37vEwxIb+u+fVW2tV/x7XchqY/5aSnVUBsu98nviqSzR2IdS81iaGARyqB
         4bEw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106346; x=1779711146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        b=K0xSqEFz3OOfHEs9ZvO/WtWmcgRmOCJ3D1bjUOVdiOhyvA7n15I3AK5Sm/SsLBqA/Z
         l+n1RIYHt6YP4RbPwpcXPuKGV5A2apOrUxQuuVqO/u8TWP9qod2o87tkn288w/FU1nqP
         Hm3qEL1JDcI7wO/mUmQ2t/8Lb6hJ9qVfDKN505ABjNo4WTEP/vmaDRweCsdSjRZKKY2K
         knPVEyjKRomZ0PmKa1VYyHrLAWdkia8NYLZpDh/t3K8hgPqizjbQvdOp/SwXjKQIX0kS
         AO9grUWtgW0d39p1OsRyB0rTMZYFlA5+s8vDbQ2m7jsmzFGStcnd5IjLzh+8LfFZPKPh
         XPww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106346; x=1779711146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        b=FDUFNGr1NsVXxXbjLIhJyiXpMmVnhilcadqPiWWMy94G8GOMVgSs/UBxv7eT+24G+A
         8TMbQPtj2kjAgRNK52d0BQlTwC6KX3dDZcl/pjeewQ3WThSNO7YQryf9Bwj5VamaMw7D
         cLI+CLPInUPWcBpueSNy+DEraai2BahA+VwCHaDnUY4q6PW/KNiWkkHcQM2fYDm/N92R
         X+6osgMeQZ7sZoaIdlu7nQ7y9b5MJIjZSgr4ENYw5/WtSSAsfRv+BRDHzbaZ7nHYiv5A
         9q3ymiMJ/6Nrs9NEpVw7tfgGfNhVytxX4cyCKOxCriF2CmElpZuB7zkr3hECm+av4vj8
         y3bw==
X-Forwarded-Encrypted: i=1; AFNElJ9VvVSkrOpsBSQmZrisUvBQ8nkdrc3D+lZQU15aBgzBlq++e/sNac+rXps63UkDXYemE0GnOlF6BftwLw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuEWUAPWNLO+FzSOPamIbAvdaKOCbS8fAHg6BsepAQB6WnazUo
	5n/bQcvU2O1fkeioQOJv/Vim6mqZjdyGe7g9OdocziEAURMWE0IV3XPMkz/0/EFKhy25YjEBnUX
	bO0ph/Gh3kOyIbgjK+IqC5PP1IcnORZg=
X-Gm-Gg: Acq92OEWMyJq09Vj7qhkGlenro+roNRqnBF//PYvF1T2wjGzSHAFjHKmpFMzISlPA98
	Kr9DYHj2GupbDyfLKO3h3sUqDl8V26oad7lt5b3wd5DOwu3TcPxQeB6jXAnL5t/fL0fZugMwN6L
	RHKy9SGpdzhUP1tejMaHN63SvVUMcS1VbRs0kSxRCSWGRNY1fGTSq2aNJl6FkPnhY0R87CwJGGM
	XMixchYRMxMBtgHm187mLPWEm2w/6dvDcpwFKW0txi+3x2lB9F4zzf53xTflPhE5BzWchIGcrCx
	oWhCJG/XvhZhx5/6h14=
X-Received: by 2002:a05:6870:f614:b0:435:25e8:35c6 with SMTP id
 586e51a60fabf-43a2dd80027mr9688351fac.23.1779106346181; Mon, 18 May 2026
 05:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com> <20260517-popper-rage-b675785e4d28@spud>
In-Reply-To: <20260517-popper-rage-b675785e4d28@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 20:12:14 +0800
X-Gm-Features: AVHnY4LDWingZwX-Nz3-YuHewnevoFTSPFgHGYd3CYxO_sW22m2PP6ryO25_4Js
Message-ID: <CAJsYDVK+tOUZcF7rzP+og5JV2gkNS4WfGhq_hJVNvfUvQLZZrg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_131228_347030_346B4EE6 
X-CRM114-Status: GOOD (  14.87  )
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

SGkhCgpPbiBNb24sIE1heSAxOCwgMjAyNiBhdCA0OjUw4oCvQU0gQ29ub3IgRG9vbGV5IDxjb25v
ckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IFsuLi5dCj4gPiArCj4gPiArICBjbG9jay1uYW1lczoK
PiA+ICsgICAgY29uc3Q6IHhpbjI1bQo+Cj4gSXMgYSAyNSBNSHogcmVmZXJlbmNlIHJlcXVpcmVk
IG9uIHRoaXMgU29DPyBJZiBub3QsIG5hbWUgaGVyZSBpcwo+IG9idmlvdXNseSBwcm9ibGVtYXRp
YyBpZiBpdCBjYW4gYmUgc29tZXRoaW5nIGVsc2UuCj4gTm90IG11Y2ggdmFsdWUgaW4gY2xvY2st
bmFtZXMgYW55d2F5IHdoZW4geW91IG9ubHkgaGF2ZSAxLgoKWW91IGFyZSByaWdodC4gSSdsbCBk
cm9wIGNsb2NrLW5hbWVzIGFuZCB1c2UgaW5kZXggdG8gZ3JhYiB0aGUKcGFyZW50IEkgbmVlZGVk
IGluIHRoZSBkcml2ZXIgaW4gdjIuCgo+Cj4gPiArCj4gPiArICAiI2Nsb2NrLWNlbGxzIjoKPiA+
ICsgICAgY29uc3Q6IDEKPiA+ICsKPiA+ICsgICIjcmVzZXQtY2VsbHMiOgo+ID4gKyAgICBjb25z
dDogMQo+ID4gKwo+ID4gK3JlcXVpcmVkOgo+ID4gKyAgLSBjb21wYXRpYmxlCj4gPiArICAtIHJl
Zwo+ID4gKyAgLSBjbG9ja3MKPiA+ICsgIC0gY2xvY2stbmFtZXMKPiA+ICsgIC0gIiNjbG9jay1j
ZWxscyIKPiA+ICsgIC0gIiNyZXNldC1jZWxscyIKPiA+ICsKPiA+ICthZGRpdGlvbmFsUHJvcGVy
dGllczogZmFsc2UKPiA+ICsKPiA+ICtleGFtcGxlczoKPiA+ICsgIC0gfAo+ID4gKyAgICAjaW5j
bHVkZSA8ZHQtYmluZGluZ3MvY2xvY2svc2lmbG93ZXIsc2YyMS10b3Bjcm0uaD4KPiA+ICsgICAg
LyB7Cj4KPiBSZXBsYWNlIHRoaXMgLyB3aXRoICJzb2MiLgoKV2lsbCBkbyBzbyBpbiB2Mi4KCj4K
PiA+ICsgICAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Owo+ID4gKyAgICAgICAgI3NpemUtY2Vs
bHMgPSA8MT47Cj4gPiArCj4gPiArICAgICAgICB4aW4yNW06IGNsb2NrLTI1MDAwMDAwIHsKPiA+
ICsgICAgICAgICAgICBjb21wYXRpYmxlID0gImZpeGVkLWNsb2NrIjsKPiA+ICsgICAgICAgICAg
ICAjY2xvY2stY2VsbHMgPSA8MD47Cj4gPiArICAgICAgICAgICAgY2xvY2stZnJlcXVlbmN5ID0g
PDI1MDAwMDAwPjsKPiA+ICsgICAgICAgIH07Cj4KPiBEZWxldGUgdGhpcyBub2RlLCBpdCdzIG5v
dCBuZWVkZWQgaW4gdGhlIGV4YW1wbGUuIFRoZSB0b29saW5nIHdpbGwgZmlsbAo+IGl0IGluLgoK
T2gsIEkgZGlkbid0IGtub3cgdGhhdC4gSSdsbCBkcm9wIGl0IGluIHYyLgoKPgo+IEFsc28sIHBs
ZWFzZSB0ZXN0IHlvdXIgYmluZGluZ3Mgc2luY2UgdGhpcyBkb2Vzbid0IHBhc3MuCj4KPiBwdy1i
b3Q6IGNoYW5nZXMtcmVxdWVzdGVkCgpJdCdzIGZhaWxpbmcgb24gdGhlIGV4YW1wbGUgYXMgcm9v
dCBub2RlIG1pc3NpbmcgIm1vZGVsIiBhbmQgImNvbXBhdGlibGUiLgphbmQgaXQgd2lsbCBiZSBm
aXhlZCBhZnRlciBjaGFuZ2luZyAiLyIgdG8gInNvYyIuCkknbGwgcmVtZW1iZXIgdG8gcnVuIHRo
ZSBmdWxsIGR0IGNoZWNrIGluc3RlYWQgb2YgdXNpbmcgRFRfU0NIRU1BX0ZJTEVTCmZvciBteSBz
aW5nbGUgZmlsZSBuZXh0IHRpbWUuCgotLSAKUmVnYXJkcywKQ2h1YW5ob25nIEd1bwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
