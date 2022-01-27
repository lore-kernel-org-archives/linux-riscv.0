Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FDEC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 14:39:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WG807zdnNEHKLLiUmTK3sgjXIHJ2ShyZyyz+K6BLVdI=; b=dbXgVSjVWJEmBl
	5z3zGw6tO4buP2WD0dbu0qLqRwxXZzaoGiMoIpVBm88cTIkPtFrwRwmmUj3PbANFw5uWM7FaXg5rp
	O4lRZnPJhHwJBF7JjR428MwcypjQsE1/KYB6l16PfwkIx/uGuKVYAjNc5LhLJOPfoEDYqTIkHVrBk
	/a4X3vSh2Wu+10dgezQMpIXQxe0Q4RCcCgxfW9pGXTbAVzs93EiRZFS/aoHHNUXvJAGeARYPEhhJV
	G6p3IDu2uKteg7/wv6et3Pets4jj86xkRSeLiLcVaqHoPOPvXNAW8QEW7giJkj0baa79E90vIGRcy
	3MKDW8rfUOPNRGg9kmsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD5vy-00G69D-Sx; Thu, 27 Jan 2022 14:39:34 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD5vu-00G67X-U8
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 14:39:33 +0000
Received: by mail-lf1-x134.google.com with SMTP id u14so5718266lfo.11
 for <linux-riscv@lists.infradead.org>; Thu, 27 Jan 2022 06:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=XkYKE/mqIw+ZogEPzGoXmtOQI8nkKTmA4V70TLbVWS4=;
 b=BHb2Xn1jq66/9MHahrzGm/gWUKtVbh/58wKW18vGWzni3fO5qyqP4VG1OOnOie8Jsh
 gDERoDSbSutwAXYx2C5vNn4TrrwM4BpgdHcNKbywEL+R5MYLhL5n2nGGvdHyYC3+WdiR
 AH7kOLTk/zgQKoF333ryAx/KFlOhDG6pX/tZk4LwhLgv5peCfB01DtWBVE+9RHO5Zn9/
 GlTTQk4e9TGZCrINPfliTtlCZdTAH9LmWOb+qXQAmfLULPmn+Omh2L6j2NgulGAPM/A+
 p0mPzTS/Ny1WZgGK/AicqnPTN5Ub7NU4t23e3Ka67Gnz7TG7Nyg0lXeqh7s3FoDGgrJx
 11/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XkYKE/mqIw+ZogEPzGoXmtOQI8nkKTmA4V70TLbVWS4=;
 b=dKreWKg0EGvkHpkdhM6UUBxv2OaWJIzynPYqv7Ah5DS/4Ld1KkMCUEcMb5MOWi+cFa
 Pub8A6z1GlPdyzbWk63em7lPJo7Twik/c0wZubIgvNyl5n0XCggQgo9bD4+eI4mxsujW
 Kq5vu+l+brUxqaxuvw/cqSvCaD5lldVnZJBfSz/v6s+24iVLnGcLvesnWHD4ZbeoF3Dv
 PhTBiFKHVQ9YuSQvxZ0M6N0I3ZxcIjqhH+IHqvE+tet54qHjojCta8o/agoLxp7EBU8/
 ux1k2vxe4bU4XhmHi2WCZ64m4ly4FATd0Gn/fhVlxUFlQoUC9s+mMIm55qk0ZiaSU4LB
 VKrw==
X-Gm-Message-State: AOAM533XKpLREPnbqV0QikqPcQ6IUcXtcP5RSq5uDpReacQMujLk454t
 j9ov2k9E70BPqbGE/L5OvHs=
X-Google-Smtp-Source: ABdhPJy1MhVvMOXi8UxQ8s4idXCyJ+ifGIsp8CpwyHRf9+W1A9LbFInI9I0x2geweWfK/i1YhzfC+Q==
X-Received: by 2002:a05:6512:3d1c:: with SMTP id
 d28mr2997039lfv.135.1643294367899; 
 Thu, 27 Jan 2022 06:39:27 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-126.dynamic.spd-mgts.ru.
 [109.252.138.126])
 by smtp.googlemail.com with ESMTPSA id r13sm476323lfr.65.2022.01.27.06.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 06:39:22 -0800 (PST)
Message-ID: <e8d3ca39-ddeb-2c21-6000-1cc65da57915@gmail.com>
Date: Thu, 27 Jan 2022 17:39:15 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 04/21] kernel: Add combined power-off+restart handler
 call chain API
Content-Language: en-US
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Greg Ungerer
 <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Greentime Hu <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Juergen Gross
 <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Guenter Roeck
 <linux@roeck-us.net>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20211212210309.9851-1-digetx@gmail.com>
 <20211212210309.9851-5-digetx@gmail.com> <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <Ydofs2CIfA+r5KAz@qmqm.qmqm.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_063930_994265_00659C8E 
X-CRM114-Status: GOOD (  22.46  )
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

SGVsbG8gTWljaGHFgiwKCjA5LjAxLjIwMjIgMDI6MzUsIE1pY2hhxYIgTWlyb3PFgmF3INC/0LjR
iNC10YI6Cj4gQlRXLCBJIGNvdWxkbid0IGZpbmQgYSByaWdodCBkZXNjcmlwdGlvbiBvZiBteSBp
ZGVhIG9mIHVuaWZ5aW5nIHRoZQo+IGNoYWlucyBiZWZvcmUsIHNvIGxldCBtZSBza2V0Y2ggaXQg
bm93Lgo+IAo+IFRoZSBpZGVhIGlzIHRvIGhhdmUgYSBzaW5nbGUgc3lzdGVtLW9mZiBjaGFpbiBp
biB3aGljaCB0aGUgY2FsbGJhY2sKPiBnZXRzIGEgbW9kZSAoe1FVRVJZXyosIFBSRVBfKiwgRE9f
Kn0gZm9yIGVhY2ggb2YgeypfUkVCT09ULCAqX1BPV0VST0ZGLCAuLi4/KS4KPiBUaGUgUVVFUllf
KiBjYWxscyB3b3VsZCBiZSBtYWRlIGluIGNhbl9rZXJuZWxfcmVib290L3Bvd2Vyb2ZmKCk6IGFs
bAo+IHdvdWxkIGJlIGNhbGxlZCwgYW5kIGlmIGF0IGxlYXN0IG9uZSByZXR1cm5lZCB0cnVlLCB0
aGVuIHRoZSBzaHV0ZG93bgo+IG1vZGUgd291bGQgY29udGludWUuIEFsbCBvZiBQUkVQXyogd291
bGQgYmUgY2FsbGVkIHRoZW4uIEFmdGVyIHRoYXQKPiBhbGwgRE9fKiB3b3VsZCBiZSB0cmllZCB1
bnRpbCBvbmUgZG9lc24ndCByZXR1cm4gKHN1Y2NlZWRlZCBvciBicm9rZQo+IHRoZSBzeXN0ZW0g
aGFyZCkuIENsYXNzaWMgZm9yKDs7KTsgY291bGQgYmUgYSBmaW5hbCBmYWxsYmFjayBmb3IgdGhl
Cj4gY2FzZSB3aGVyZSBhcmNoL21hY2hpbmUgKGxvd2VzdCBwcmlvcml0eSkgY2FsbCB3b3VsZCBy
ZXR1cm4gaW5zdGVhZAo+IG9mIGhhbHRpbmcgdGhlIHN5c3RlbSBpbiBtYWNoaW5lLWRlcGVuZGVu
dCB3YXkuIFRoZSBRVUVSWSBhbmQgUFJFUAo+IHN0YWdlcyBjb3VsZCBiZSBjb21iaW5lZCwgYnV0
IEkgaGF2ZW4ndCB0aG91Z2h0IGFib3V0IGl0IGVub3VnaCB0bwo+IHNlZSB3aGF0IGNvbmRpdGlv
bnMgd291bGQgbmVlZCB0byBiZSBpbXBvc2VkIG9uIHRoZSBjYWxsYmFja3MgaW4KPiB0aGF0IGNh
c2UgKG1heWJlIGl0J3Mgbm90IHdvcnRoIHRoZSB0cm91YmxlLCBzaW5jZSBpdCBpc24ndCBhIGZh
c3QKPiBwYXRoIGFueXdheT8pLiBUaGUgZ29hbCBoZXJlIGlzIHRvIGhhdmUgbGVzcyAoZHVwbGlj
YXRlZCkgY29kZSBpbgo+IGtlcm5lbCwgYnV0IG90aGVyd2lzZSBpdCBzZWVtcyBlcXVpdmFsZW50
IHRvIHlvdXIgQVBJIHByb3Bvc2FsLgoKVGhhbmsgeW91IGFnYWluIGZvciB5b3VycyBwcm9wb3Nh
bCEgSU1PLCBpdCdzIG11Y2ggbW9yZSBpbXBvcnRhbnQgdG8Ka2VlcCB0aGUgY29yZSBjb2RlIHNp
bXBsZSBhbmQgbWFpbnRhaW5hYmxlLCByYXRoZXIgdGhhbiB0cnkgdG8gb3B0aW1pemUKaXQgd2l0
aG91dCBhIHZlcnkgZ29vZCByZWFzb24sIGdpdmVuIHRoYXQgdGhpcyBpc24ndCBhIGhvdCBjb2Rl
IHBhdGggYXQKYWxsIGFuZCBzYXZpbmcgYSBjb3VwbGUgb2YgYnl0ZXMgd29uJ3QgYmUgbm90aWNl
YWJsZS4gVGhlIHBvd2Vyb2ZmLApyZXN0YXJ0IGFuZCByZWJvb3Qgd2VyZSBzZXBhcmF0ZWQgYmVm
b3JlIHRoaXMgc2VyaWVzIGFuZCBJJ20gZmluZGluZwp0aGF0IGl0J3MgZWFzaWVyIHRvIGZvbGxv
dyB0aGUgY29kZSB3aGVuIGl0J3Mgc3RydWN0dXJlZCB0aGF0IHdheS4gSSdtCm5vdCBjb252aW5j
ZWQgdGhhdCB3ZSBuZWVkIHRvIGNoYW5nZSBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
