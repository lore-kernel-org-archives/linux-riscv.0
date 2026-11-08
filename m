Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB95606A31C
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 08:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A3vXtvLg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=NH7XgaxO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qVmDISO3iyy+e1rjr0zr6YQYOMbBuvqN0zKNspiaqOQ=; b=A3vXtvLglFmywOFvYV1/6fzOmP
	7EHxkmrNkU68a7pno9xLw9RenLbVS63Pyv8h3PW4+t5L5lFPvXKuRNr8mDuzEwK2GZc3qeW/uNe8S
	7yBe6fFjFZby6lgXpkh9/KSGzn6EsFGrAAAlLxfezJMqUfbqPltauJe0PhZFEjRPxMozcVuTwSowA
	r1htg/6mS4xfVT62xGqyTjw2kLJAK3BkXCxNzjBuj2kfetXyuEpQUMD/6rHNkmzo3u/PZ1gxCQzAX
	bzSb2zYLjioid2/FggQ7PJJZSbZZWyE1AO8L4T9jtBc+0ivKMEYADjgJUaNf7dSTomm/ANVskJzNB
	TaFmdeqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyFp-0000000Fqg2-2D6C;
	Sun, 08 Nov 2026 08:27:57 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPyFn-0000000FqfS-0TBn
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 08:27:57 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-847ac7ccd85so138435a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Nov 2026 00:27:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794126473; cv=none;
        d=google.com; s=arc-20260327;
        b=PepTG8JYA8cLpp9agNI+SFNqF+MGsi90+iY7pfKeal/ALLq54VCD31NrQcqkLNDQn3
         +HtPkvV42lVG0sbPDt3I2YcGkokXGXbvGgLdvBLnZvzHJewdJpynkNofiOnMjG854+lV
         ZXIjuAR9Jwi6zr2xr6IjtbdieTcW4bj7uBEbAF5KdcolSaZPT20SjujRHG/pYl+XX7Jl
         uWwI2JXuDUq87mOHUSYnBobZXAd4twsC4soe5oSNWCeaVmE5dw3zktZjt2Qkrf2iifPo
         +goSXit5xl5AlDvTQfb6uRqnyJ8CvVww0QEK2SyYtqfAqfnTIahVEeemMOQs0NZcsFsO
         KnUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        fh=eve0IYYhZ6k68WGIYlFDwvLrerykrw2fYaDlgsKbCRk=;
        b=FG6FJsVbXTzkL6yHjB65Lu8qQReA+DNwRSsm6x6n7etutgdTWhDIzuMiVdpOMk1ITy
         QXC1XRR72VBQb5acX0SZWZyoiywVrbc/w3qlN51OmDWckITT5auv9W2Ha4XzfGdnK7OH
         m07XdFOT+brKvaJOu2rbAMjPpZFr6nsUYEcX9/8LD5z7j4TVxrhv7RbYvBDb4XXtj5bv
         u8cDg8vtG7tFBgbAbgIJ0Gk8PAwRjKns4ucDILKkX5H6PcD/t27ew7fmUjln20pWDl8e
         WAD0KN70F8fLgg1sHytjNqx36ip8zqh3aE/0zrCsw98hZcp3r9RoBCX+4DFEL9ew79at
         +9MQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1794126473; x=1794731273; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        b=NH7XgaxOXcRSt8BStQVW6Tc1dv7YiQl1ylMZsnDxzfTXuUEohIiIf0T4kMmBLlJzl5
         xced+TI+o+DlcK6nkas5Qb2rZxS4IpWg4imeewUy4d2hwfCu5NDUfKAxLJBIQ45sfV7K
         zPRhu6EOjc3AISgPoheD6sKCdB+n7BE/yTya8ShNX6x0zacoWj47riSc8zqVIY59c4zh
         46kPh+P699gHICg+gIKSSF52uN//XhSuuFrCnYYpo4o036bEHBZrhKZ8DJ/A9occJJ3i
         s8vPvIdRPZ2veOq4h5wAbrjSpf5OldlA9NZjP+5D+ZASegVPrx65/WNuS0ty3TacbiP8
         ywEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794126473; x=1794731273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LHJ/s2pok+cQGyJRZxhcYGZiYXJmh71TKyHNP9sAFZs=;
        b=YsZ2yj+i+dF11aM8wb+wVSV9cuTErlUxoQ8KhIGtPyvT8K9nt2epK7re5k4nx7WGR8
         G+ixo2xEYb+qCUUrs5ztOUjUIKS28W7XQEdCb8205DNRMQVyAtNJ1j7cy7FHYMBU+3wB
         264oCtHsq9DyHPp8HnIJo2f08t5Bxh/c7R94LdzXJ40JHC15pW2HEZBfNLe27jMBJUlN
         h5AfIDjKkoOBrCsi3k8XiIRxZS9gk8TGUr0DxsvKsGmU1ZA9vGC5ctXAI3tjaFtQSlK3
         t25Vo/CAOwRBU7flyQscpkQOUx4hZeI6R2tSfaempnMAo+rGUoppri7P+o/6Id3yl6rh
         qNtw==
X-Forwarded-Encrypted: i=1; AKwUvBziPUaB5K0zcUUFOYWHUcbTsgKNhgHnPNsogYI6DoZcSloOQlHvW7T0S0G3ZWBVeKlXiKGhKzfOPkv+1g==@lists.infradead.org
X-Gm-Message-State: APuU4Z+hbFCsydkUmwvPqtxbSuzUDXP8mIDBGs7LgHUkBPIPrBZRcLUt
	vaxODV+NFH3WS0euUeNYSYywQ08GijdZw9pQzNmB5p724rHsooodH5duwRHQaQsnmmCy/Gu9Iu1
	00FtRrFn80x+jkwFyMQhtwIYIeqyqxC2LRDw2a9eaOA==
X-Gm-Gg: AYBFou3BgITLjtvZof72sLF8ndFxTNhrSQOWvmge2OT3WlhmCm75YgicUYgyr/Kc1M1
	HgtR74WkRWPgpNmv/RYeUppZtVDEEVaywKcbRLj9ewZlKxY/idUWyB8gvn2zUtX72QSHzEBj3/p
	Co41sjZKsu+uodPcPs8NjIpl2kwWUiJlldCIqdLWPuzskzyhgHgV9G4MNBSf40N99V4dRFGj6Wn
	IXbj63rN92Eo7X9fSl2fH2grcNukfHH1Il+Zfp0u0xR403+UJzyhOkplICA1i7ODGeTH4h6oluO
	vuuQTBL1NCxg3y5lr9dblu1Utix5djqLNV/VZtymW7YkLqfjnXsh8kIKaUyobM3EBC2cGylpB//
	6dx3t1YXMO6nhxrdxMk3c90EnzFsFTDSS6U4edvDePKG/
X-Received: by 2002:a05:6830:71a3:b0:80c:d34f:5f5a with SMTP id
 46e09a7af769-85f5075a36fmr645255a34.19.1794126472981; Sun, 08 Nov 2026
 00:27:52 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260703122832.15984-1-cuiyunhui@bytedance.com>
 <20260703122832.15984-4-cuiyunhui@bytedance.com> <87bjcnlrbv.ffs@fw13>
In-Reply-To: <87bjcnlrbv.ffs@fw13>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Sun, 8 Nov 2026 16:27:42 +0800
X-Gm-Features: AclHuK-No24RzFz5kz6KGOgepjfUU9hWv2-yH0FoZIN8FZ2Py9-_ynkukYR0a6s
Message-ID: <CAEEQ3w=B4p-_4pg3ffrkSA_AXuz86FCd-w4FSB50HoijcSL74w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v8 3/3] riscv: store percpu offset into thread_info
To: Thomas Gleixner <tglx@kernel.org>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dennis@kernel.org, tj@kernel.org, cl@gentwo.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, memxor@gmail.com, song@kernel.org, yonghong.song@linux.dev, 
	jolsa@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org, 
	thuth@redhat.com, ajones@ventanamicro.com, ben.dooks@codethink.co.uk, 
	rkrcmar@ventanamicro.com, samuel.holland@sifive.com, zong.li@sifive.com, 
	conor.dooley@microchip.com, debug@rivosinc.com, seanwascoding@gmail.com, 
	andybnac@gmail.com, menglong8.dong@gmail.com, cyrilbur@tenstorrent.com, 
	wangruikang@iscas.ac.cn, atishp@rivosinc.com, apatel@ventanamicro.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, bpf@vger.kernel.org, arnd@arndb.de, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	qingfang.deng@siflower.com.cn, linux-arch@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_002755_451255_DE0B382C 
X-CRM114-Status: GOOD (  11.16  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgVGhvbWFzLAoKT24gU2F0LCBKdWwgNCwgMjAyNiBhdCA1OjAy4oCvQU0gVGhvbWFzIEdsZWl4
bmVyIDx0Z2x4QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdWwgMDMgMjAyNiBhdCAy
MDoyOCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+ICsKPiA+ICBleHRlcm4gc3RydWN0IHRhc2tfc3Ry
dWN0ICpfX3N3aXRjaF90byhzdHJ1Y3QgdGFza19zdHJ1Y3QgKiwKPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKik7Cj4gPgo+ID4gQEAg
LTEyMiw2ICsxMjksNyBAQCBkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgXAo+ID4gICAgICAgaWYgKHN3aXRjaF90b19zaG91bGRfZmx1c2hf
aWNhY2hlKF9fbmV4dCkpICAgICAgXAo+ID4gICAgICAgICAgICAgICBsb2NhbF9mbHVzaF9pY2Fj
aGVfYWxsKCk7ICAgICAgICAgICAgICAgXAo+ID4gICAgICAgX19zd2l0Y2hfdG9fZW52Y2ZnKF9f
bmV4dCk7ICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgX19zd2l0Y2hfdG9fcGNwdV9v
ZmZzZXQoX19uZXh0KTsgICAgICAgICAgICAgICAgXAo+Cj4gV2h5IGRvIHlvdSB3YW50IHRvIGdv
IHRocm91Z2ggdGhlIGluZGlyZWN0aW9uIG9mIGN1cnJlbnQ6Cj4KPiA+ICtzdGF0aWMgaW5saW5l
IHZvaWQgX19zd2l0Y2hfdG9fcGNwdV9vZmZzZXQoc3RydWN0IHRhc2tfc3RydWN0ICpuZXh0KQo+
ID4gK3sKPiA+ICsjaWZkZWYgQ09ORklHX1NNUAo+ID4gKyAgICAgbmV4dC0+dGhyZWFkX2luZm8u
cGNwdV9vZmZzZXQgPSBfX215X2NwdV9vZmZzZXQ7Cj4gPiArI2VuZGlmCj4gPiArfQo+Cj4gaW5z
dGVhZCBvZiB1c2luZyBfX3ByZXYtPi4uLi4ub2Zmc2V0LCB3aGljaCBpcyByaWdodCB0aGVyZSBh
dmFpbGFibGU/Cj4KCkFncmVlZC4gY3VycmVudCBpcyBfX3ByZXYgYXQgdGhpcyBwb2ludCwgYW5k
IGJvdGggZm9ybXMgY29tcGlsZSB0byB0aGUKc2FtZSBsb2FkL3N0b3JlIHNlcXVlbmNlLiBQYXNz
aW5nIF9fcHJldiBleHBsaWNpdGx5IGlzIGNsZWFyZXIsIHNvIEkgd2lsbApjb3B5IGl0cyBwY3B1
X29mZnNldCBkaXJlY3RseSB0byBfX25leHQuCgpUaGFua3MsCll1bmh1aQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
