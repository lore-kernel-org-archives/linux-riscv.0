Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8EE103A999
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Mar 2026 02:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6sCZxoXgJcGUMwbL9UGBnOo36KgLDNYzn258YCDjFo=; b=NSfs0lsEwdWr8g
	zuH89cbjYpq4+Ri8DQf8tMW9ZZgCeBQkBtBz6xLrFsA3NEOywnv6Oe/JagRQElQj8wi+8fZ/AP4su
	Z1Ls0g2MIA2LQsaVogSBLkJcTZfkpW6N0j0dPprCi9g28SkzTP8v2/NEaigoz//rSeraCW0Lw4lvU
	f2CVK5/iE0YbFnv0ljV/6DI96ScpdrHq2F6VsivW9e6wc4FUb5Bt2kOTor4KU+xCs7ktXrPb5/zOz
	Y7ZORMedwJ8qB4pPXXOYEJD1Cvp3ql08h1qSl3HXUIAqbBpMhsJirNOncaGN0rnvhPL336qe6pkIO
	xmS9QYg+FuYJMYVKHEIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5E2E-00000002W0H-3MUQ;
	Wed, 25 Mar 2026 02:31:54 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5E2C-00000002Vzu-0zW1
	for linux-riscv@lists.infradead.org;
	Wed, 25 Mar 2026 02:31:53 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7d9d929e27aso215124a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Mar 2026 19:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774405911; cv=none;
        d=google.com; s=arc-20240605;
        b=dsSGVRWxPWcCpJzZarpOcJcGQfDBsEtXAXuH6jKJ0uPdg1zGBlo/Bt1LOEedoH/+ej
         M2wAK+b0yOuEyiCKGD+ImkXRYveAKL6k18yrb0UTmWyMe9xMC3sRISCCy2lg5t5cjrh3
         m7ibNN2Wi/j3+4i9o2pBjFitAohpUGhP4RjP+wYyFMb57wVjCPLL8hvdIGLlefC1l5Ej
         AcM0rTJLN+G76S1zKPxeN07+s9zBKQApexJS+knHZn+CBcpGg5f7WsnaY0q9T05inClW
         hUHsHxDU7VXDx/TRJSADY6nJKwY9BG94DxQ/oeoniUL+WLgURp0whNzZSBSNbzvA8Skh
         qcIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z6L/dK9RXBU0ye50vaCd1XpagmdaKpcR91kPPZAxHEc=;
        fh=2+wrO+KyVoH61lerHt263MjNn5DV9vxdFq5c9mRHj78=;
        b=OUSxG3on03dA4gGyCt4BCW4iJH1i2cESpOwPr2bGxpfOYY/9/bFDwUMyAWUS2NYSb9
         wsu9aVjqyX12iv/LLtzx5UPqaarbTwkmxsAfZgJgRIq8I6kpLLVKR4eV+qvBcOuFyrq9
         GiQ2796omgIx6+/vWuaqumLuDSBg37ykmCK0VrAtqBC+mworbtG6t9LrlSRYFUUkiGHb
         i9+Vx15l5gxwHUTKl2RtL0NRYMZggTRjKOfSokwmr8XVkB/BaBw8sHY7+4sPL4rDjUJS
         A9/g+a0LknN9rsHvCFN2NeCafd99uXqK8HhWLJQ22hO2bQSYNGdeYO8E/MQS4mX9E/iA
         ydBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1774405911; x=1775010711; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z6L/dK9RXBU0ye50vaCd1XpagmdaKpcR91kPPZAxHEc=;
        b=WYDs+1UOXsiC1uLPX39Pny+5r/JzopkPtXbRQA7mBV1fSP/uVHcHTNlNXy+0fl+US2
         +kwG55pdAZkGIF/mUPjMTuzaD4sDJtaa2A+MTRWPsZI1W4LgPOiquomnVLbmCvaolAt7
         MNfRAhPdc76V4gY5ntIgPsn8mzTYSsfeEA4cXWLiwJc72zbsf3rbGJOnu3Oj5jruuQ4L
         SWiqxpWROrK8gW7tew3N9dnltB1EdaKz0VMV/dNXj3MoVuO1fDrSpOX9HBbMTa3GRG1O
         cmYd7kntV5B/lyi0YjBexZKDc66A8YJAjHWN+mlRk10cn4amLC64vHUwDmADDIuX2oWA
         pjAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774405911; x=1775010711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z6L/dK9RXBU0ye50vaCd1XpagmdaKpcR91kPPZAxHEc=;
        b=F9ZzgD26k8J9rFqjcs5LptfzCGHIXCaXRIJo5pnIXJp5bqYsxkLY0M1leGko7UIOyy
         O5qG8vXsRIWCbHJteNbakUrmO9Vw0HPEqO6QAm8n9QiDIjPAunYw3fcRtB34OkFueZcN
         5mBAAJXSBZpBoYJk9wfn6/bCxwINvrI0fYqk0KI17lO8IB8K81evLaAk407+bptg00ux
         MaO+V27yyuAGimLnCekyrJbSsNWHjJiFnur+KdswQAzGso074HKR7+fOvbqPAMIzR+Aw
         W1LAMfauAYE0zYRqwG8tzun7xaY4cPjFdwT9BFQ7GFuatrnqn9Wbk+LTXETBwFC2AkXR
         1JfA==
X-Forwarded-Encrypted: i=1; AJvYcCX6s9fF2ESqqn6BogWwvPEx7qqjXMgyoUEa0B7FytvxCpR94epUTDfkyqUeRBz/mwREeQ5Hxv0XX4NR8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzAu0J8cdiZGpNiz+GUIA4bJNcQ89jht3Pl1u4XYAW8AclwPeYo
	5uXkX2kw0NYLrqq6SaZmGcp0oF5iapGQPWzNF9sfpKmqRuEBRcu2Nk+A0jRWimZoM0qV4+GC4V1
	Yu/D9gkEMCBXpYx4pLYZSuxqivCuSg8TUCgIOuCSbdg==
X-Gm-Gg: ATEYQzzqaqeq3ndjYa3+tyINRhbpFiiXEhlsVF4oeUZe66Wiv2eKpooIZrZ3D3uC9rq
	2fh0RrbhmwtM3caO079J7excZbX5cV0Hmiebq7spM0L73hYvDh38v0SBsz5oFFu7EbJ3qPfGIWL
	DmclGctPrcWbdpJiKnbArnRd6+9nTe3yD6Pg3dBfAGNAJ5yPgeHQC2RBnRI164yHlj7VHp7Yd54
	ZXpYmLEcK3TVS8O2cJQXsPKmC8G6x35BUY5Yc9gFbOmrviIK7YH6yL8QCEYtPmOCR/wUD74h4gO
	K0mf8z5wZdepWg==
X-Received: by 2002:a05:6830:82b4:b0:7d9:b46f:ee21 with SMTP id
 46e09a7af769-7d9d69cdf4bmr897075a34.16.1774405910770; Tue, 24 Mar 2026
 19:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org> <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 25 Mar 2026 10:31:39 +0800
X-Gm-Features: AaiRm50kmkkX4lpUb-H53j141xOJJF0B4hNLojrNS59qLQl25FnWptD4NwPaAxM
Message-ID: <CAEEQ3wmuAnHU1VBFDwbCBFb8j63ZcizJ3jEC2SiVWnoMPc4=SA@mail.gmail.com>
Subject: Re: [External] [PATCH RFC v2 06/17] RISC-V: QoS: define CBQRI resctrl
 resources and domains
To: Drew Fustini <fustini@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_193152_296306_5A935C23 
X-CRM114-Status: GOOD (  15.84  )
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
Cc: Atish Patra <atish.patra@linux.dev>, Adrien Ricciardi <aricciardi@baylibre.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor+dt@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, devicetree@vger.kernel.org, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, guo.wenjia23@zte.com.cn, linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Peter Newman <peternewman@google.com>, x86@kernel.org, acpica-devel@lists.linux.dev, Robert Moore <robert.moore@intel.com>, liu.qingtao2@zte.com.cn, linux-acpi@vger.kernel.org, Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, Dave Martin <Dave.Martin@arm.com>, Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>, Chen Pei <cp0613@linux.alibaba.com>, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, Babu Moger <babu.moger@amd.com>, Weiwei Li <liwei1518@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Ved Shanbhogue <ved@rivosinc.com>, Reinette Chatre <reinette.chatre@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, Tony Luck <tony.luck@intel.com>, Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Paul Walmsley <pjw@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgRHJldywKCk9uIFRodSwgSmFuIDI5LCAyMDI2IGF0IDQ6MjjigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBEZWZpbmUgZGF0YSBzdHJ1Y3R1cmVzIHRv
IGVuY2Fwc3VsYXRlIHRoZSByZXNjdHJsIHJlc291cmNlCj4gYW5kIGRvbWFpbiBzdHJ1Y3R1cmVz
Lgo+Cj4gQ28tZGV2ZWxvcGVkLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJheWxp
YnJlLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBBZHJpZW4gUmljY2lhcmRpIDxhcmljY2lhcmRpQGJh
eWxpYnJlLmNvbT4KPiBbZnVzdGluaTogcmViYXNlZCBjdXJyZW50IHVwc3RyZWFtXQo+IFNpZ25l
ZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2tlcm5lbC9xb3MvaW50ZXJuYWwuaCB8IDI3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMjcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3Yva2VybmVsL3Fvcy9pbnRlcm5hbC5oIGIvYXJjaC9yaXNjdi9rZXJuZWwvcW9z
L2ludGVybmFsLmgKPiBpbmRleCBmZjJjN2VmZjUwYmUuLmMwNDAyZGQwNmNmYSAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9xb3MvaW50ZXJuYWwuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Fvcy9pbnRlcm5hbC5oCj4gQEAgLTY1LDYgKzY1LDExIEBACj4gICNkZWZpbmUgQ0JR
UklfQkNfQUxMT0NfQ1RMX09QX1JFQURfTElNSVQgICAyCj4gICNkZWZpbmUgQ0JRUklfQkNfQUxM
T0NfQ1RMX1NUQVRVU19TVUNDRVNTICAxCj4KPiAraW50IHFvc19yZXNjdHJsX3NldHVwKHZvaWQp
Owo+ICt2b2lkIHFvc19yZXNjdHJsX2V4aXQodm9pZCk7Cj4gK2ludCBxb3NfcmVzY3RybF9vbmxp
bmVfY3B1KHVuc2lnbmVkIGludCBjcHUpOwo+ICtpbnQgcW9zX3Jlc2N0cmxfb2ZmbGluZV9jcHUo
dW5zaWduZWQgaW50IGNwdSk7Cj4gKwo+ICAvKiBDYXBhY2l0eSBDb250cm9sbGVyIGhhcmR3YXJl
IGNhcGFiaWxpdGllcyAqLwo+ICBzdHJ1Y3QgcmlzY3ZfY2JxcmlfY2FwYWNpdHlfY2FwcyB7Cj4g
ICAgICAgICB1MTYgbmNibGtzOyAvKiBudW1iZXIgb2YgY2FwYWNpdHkgYmxvY2tzICovCj4gQEAg
LTEyNSw0ICsxMzAsMjYgQEAgc3RydWN0IGNicXJpX2NvbnRyb2xsZXIgewo+ICAgICAgICAgYm9v
bCBtb25fY2FwYWJsZTsKPiAgfTsKPgo+ICtzdHJ1Y3QgY2JxcmlfcmVzY3RybF9yZXMgewo+ICsg
ICAgICAgc3RydWN0IHJkdF9yZXNvdXJjZSAgICAgcmVzY3RybF9yZXM7Cj4gKyAgICAgICBzdHJ1
Y3QgY2JxcmlfY29udHJvbGxlciBjb250cm9sbGVyOwo+ICsgICAgICAgdTMyIG1heF9yY2lkOwo+
ICsgICAgICAgdTMyIG1heF9tY2lkOwo+ICt9Owo+ICsKPiArc3RydWN0IGNicXJpX3Jlc2N0cmxf
ZG9tIHsKPiArICAgICAgIHN0cnVjdCByZHRfZG9tYWluX2hkciAgICAgICByZXNjdHJsX2RvbV9o
ZHI7Cj4gKyAgICAgICBzdHJ1Y3QgcmR0X2N0cmxfZG9tYWluICByZXNjdHJsX2N0cmxfZG9tOwo+
ICsgICAgICAgc3RydWN0IHJkdF9tb25fZG9tYWluICAgcmVzY3RybF9tb25fZG9tOwo+ICsgICAg
ICAgdTY0IGNibTsKPiArICAgICAgIHU2NCByYndiOwo+ICsgICAgICAgdTY0ICpjdHJsX3ZhbDsK
PiArICAgICAgIHN0cnVjdCBjYnFyaV9jb250cm9sbGVyICpod19jdHJsOwo+ICt9Owo+ICsKCkNh
biB3ZSB0cmltIGRvd24gc29tZSBmaWVsZHM/IEZvciBleGFtcGxlOgogc3RydWN0IGNicXJpX3Jl
c2N0cmxfcmVzIHsKICAgICAgICBzdHJ1Y3QgcmR0X3Jlc291cmNlICAgICByZXNjdHJsX3JlczsK
LSAgICAgICBzdHJ1Y3QgY2JxcmlfY29udHJvbGxlciBjb250cm9sbGVyOwogICAgICAgIHUzMiBt
YXhfcmNpZDsKICAgICAgICB1MzIgbWF4X21jaWQ7CiB9OwoKIHN0cnVjdCBjYnFyaV9yZXNjdHJs
X2RvbSB7Ci0gICAgICAgc3RydWN0IHJkdF9kb21haW5faGRyICAgICAgIHJlc2N0cmxfZG9tX2hk
cjsKICAgICAgICBzdHJ1Y3QgcmR0X2N0cmxfZG9tYWluICByZXNjdHJsX2N0cmxfZG9tOwogICAg
ICAgIHN0cnVjdCByZHRfbW9uX2RvbWFpbiAgIHJlc2N0cmxfbW9uX2RvbTsKLSAgICAgICB1NjQg
Y2JtOwotICAgICAgIHU2NCByYndiOwogICAgICAgIHU2NCAqY3RybF92YWw7CiAgICAgICAgc3Ry
dWN0IGNicXJpX2NvbnRyb2xsZXIgKmh3X2N0cmw7CiB9OwoKPiArc3RydWN0IGNicXJpX2NvbmZp
ZyB7Cj4gKyAgICAgICB1NjQgY2JtOyAvKiBjYXBhY2l0eSBibG9jayBtYXNrICovCj4gKyAgICAg
ICB1NjQgcmJ3YjsgLyogcmVzZXJ2ZWQgYmFuZHdpZHRoIGJsb2NrcyAqLwo+ICt9Owo+ICsKPiAg
I2VuZGlmIC8qIF9BU01fUklTQ1ZfUU9TX0lOVEVSTkFMX0ggKi8KPgo+IC0tCj4gMi40My4wCj4K
ClRoYW5rcywKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
