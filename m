Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B724AC8303C
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 10:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xzjY092lsNR4rv4Ei90c8V2a/h1sLQfprpkesui5dmI=; b=NwchD+4YuMwRuf
	MLTnUonUQzVZT+BWKzM1hgxre8ZKvMekDmTn8U3ir18LG3+a9yG4XuLQXfCXhzVwZkkoknGkDpY52
	C3zFzEAf7FtDvJX7rDMKomwrQndvixiAoFOnL8VVwdsL22SQ4xwQ+IWmzGAmVl9K1vgj1k9hkBnFn
	WhbEiRCzN0P99m+jT49pD8TTzkop1k2HoVjfb/vFWPn5LTcSXFkPExBU8A+gRO4l7waCdS6vni6Q3
	tQPz9ikTDqgWMXfDbrBqBiC33FuCf/D2nEMmv517+Ou3vivwK6ZYgT+U1LC5TU34KlZIVfZBRjTid
	YC0BKfA9fbwD0Ll1GbHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYj3y-000000029Dn-2dzJ;
	Mon, 07 Jul 2025 10:27:06 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYiV9-0000000230y-46fD
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 09:51:09 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so2699554f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Jul 2025 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751881866; x=1752486666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gVjxdqHTuMJYD+Ho2g5ihe5EvWRJ3OhfB9FF+ZiWNvg=;
        b=Ey4PSbxpYCPs47oSV+S2ch0ummGGQd7LqZt4ZFS06v79zLQyJIUrysvPXawfgRkgvt
         zTcyex9aVjI/jvVlIepFvx8cutGJlgS9wpdnasKsMDyi754MumIMSXw4B69Ki//EmbsQ
         k5FQzGamSJPMEdeVnksrYcW/WJ1i+t0Ev8LyBqYdxrLR99giD1y8oexQYJRqxYquYeRV
         DP69Tb9QQF7I29Vd7c8FiZw6t3KYPz81nZ3VhMs8fjhIw+9RCzejxrlBkt815e25cu5e
         010e5weTjE/FChq8iInTQo6QW2XkGyLj9iA/kcAPnVhvl3AYKQveYtWqY/jcRc86k2yn
         IV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751881866; x=1752486666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gVjxdqHTuMJYD+Ho2g5ihe5EvWRJ3OhfB9FF+ZiWNvg=;
        b=a3UKVHMVt1u0J+QIDLeeXdLl8IzaJw1lZGS7cgqvWlUyIjKY+ZxNO/O2LyaE1pM7Oa
         lqQqcDnk/+2Wnc7PvU2LZ4tjSlUY9u9Wp1INwdEb0ZKUv9rOGwS/eYA4hvipHElKumVE
         xQ4tZYbGcjlN4s7b+SEJuzWi1AenjFPEqawqD4ZbQ6jVlzSaAS8g6sbBrDWD7wrwGvPP
         tDmGw5tMrrIIhHjIdfVEoTR8LnwBtFbN9X0MRaSYFtlc1MFhq7X+iNTB1HvcAu5HIkly
         9Juq6s6UTqqH5lVTWQzraPvSSZJR9WxCGNkkzc9mS9ItrnvLY6X148TD8k2kjH/S6xx6
         4Fag==
X-Forwarded-Encrypted: i=1; AJvYcCUOa0Gxd10P6j8qizatuIb7u57+zAChAVSOD6rhKwbCc6QVyFcFaCaf6l5YyufEDx6uDa+089Fzw+TTmA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0OAtQwAmI6p/j4QRm95mPteuMYqqMFAFTr1FqBtE9SaqKuXjO
	0ZGsyQR6ouh0JwakCN0Rb8p9u0eyEqlsjNAo5kJwS2ZcVLv+n9qHDSLqIPBDgoRq/sK/EyHeYnP
	lm3Smd990F7MEQxLcqu+C6QenFexZF1c=
X-Gm-Gg: ASbGncvg4Y61yXccDkZAVE2N/rQWpwt+MOfSLk5fDq4tRV/2+y/WySLfLDXHLKdLu9R
	xq6ZTtsuMDN0PkPNM0WlNfDYxV1GgHeqtJbCFGeg5fb64UZNNQ0vgC2QYKqT+nBFl6zjqwC38AH
	wCaOE2j2tsl3Ouw/oOn5zTjVvYgLsXxSyUQ+eWrVKOYfuHUw==
X-Google-Smtp-Source: AGHT+IHaemfV7Yc8MYTOKmXHmjBgPc678uQXZOdUIfyot5vgXXAe6u2p/8rl0gl5MOdA1YcH9Rs+GNziSjER+UHyVSs=
X-Received: by 2002:a05:6000:1449:b0:3b3:9c75:a4fb with SMTP id
 ffacd0b85a97d-3b497029621mr9832614f8f.33.1751881865712; Mon, 07 Jul 2025
 02:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <20250704081451.2011407-1-ben717@andestech.com> <20250704081451.2011407-2-ben717@andestech.com>
In-Reply-To: <20250704081451.2011407-2-ben717@andestech.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 7 Jul 2025 10:50:38 +0100
X-Gm-Features: Ac12FXx7rJuxVDh4Pe2HacJlhHB6J3LpsyU6J4KL8NZ4EBGUAf2JV3T_SbkKDpM
Message-ID: <CA+V-a8unFMmA2NdwuofTL1fx8vVHtD8Y9QbW2ec8B656DK6AAw@mail.gmail.com>
Subject: Re: [PATCH 1/8] riscv: add Andes SoC family Kconfig support
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: arnd@arndb.de, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, tglx@linutronix.de, daniel.lezcano@linaro.org, 
	prabhakar.mahadev-lad.rj@bp.renesas.com, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	soc@lists.linux.dev, tim609@andestech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_025108_015421_3E7E1540 
X-CRM114-Status: GOOD (  16.49  )
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

SGkgQmVuLAoKVGhhbmsgeW91IGZvciB0aGUgcGF0Y2guCgpPbiBGcmksIEp1bCA0LCAyMDI1IGF0
IDEwOjAy4oCvQU0gQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+IHdyb3Rl
Ogo+Cj4gVGhlIGZpcnN0IFNvQyBpbiB0aGUgQW5kZXMgc2VyaWVzIGlzIFFpTGFpLiBJdCBpbmNs
dWRlcyBhIGhpZ2gtcGVyZm9ybWFuY2UKPiBxdWFkLWNvcmUgUklTQy1WIEFYNDVNUCBjbHVzdGVy
IGFuZCBvbmUgTlgyN1YgdmVjdG9yIHByb2Nlc3Nvci4KPgo+IEZvciBmdXJ0aGVyIGluZm9ybWF0
aW9uLCByZWZlciB0byBbMV0uCj4KPiBbMV0gaHR0cHM6Ly93d3cuYW5kZXN0ZWNoLmNvbS9lbi9w
cm9kdWN0cy1zb2x1dGlvbnMvYW5kZXNoYXBlLXBsYXRmb3Jtcy9xaWxhaS1jaGlwLwo+Cj4gU2ln
bmVkLW9mZi1ieTogQmVuIFpvbmctWW91IFhpZSA8YmVuNzE3QGFuZGVzdGVjaC5jb20+Cj4gLS0t
Cj4gIGFyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEgfCAyICstCj4gIGFyY2gvcmlzY3YvS2NvbmZp
Zy5zb2NzICAgfCA5ICsrKysrKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuZXJy
YXRhIGIvYXJjaC9yaXNjdi9LY29uZmlnLmVycmF0YQo+IGluZGV4IGUzMTgxMTlkNTcwZC4uYmU3
Njg4MzcwNGE2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvS2NvbmZpZy5lcnJhdGEKPiArKysg
Yi9hcmNoL3Jpc2N2L0tjb25maWcuZXJyYXRhCj4gQEAgLTEyLDcgKzEyLDcgQEAgY29uZmlnIEVS
UkFUQV9BTkRFUwo+Cj4gIGNvbmZpZyBFUlJBVEFfQU5ERVNfQ01PCj4gICAgICAgICBib29sICJB
cHBseSBBbmRlcyBjYWNoZSBtYW5hZ2VtZW50IGVycmF0YSIKPiAtICAgICAgIGRlcGVuZHMgb24g
RVJSQVRBX0FOREVTICYmIEFSQ0hfUjlBMDdHMDQzCj4gKyAgICAgICBkZXBlbmRzIG9uIEVSUkFU
QV9BTkRFUyAmJiAoQVJDSF9SOUEwN0cwNDMgfHwgQVJDSF9BTkRFUykKPiAgICAgICAgIHNlbGVj
dCBSSVNDVl9ETUFfTk9OQ09IRVJFTlQKPiAgICAgICAgIGRlZmF1bHQgeQo+ICAgICAgICAgaGVs
cAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L0tjb25maWcuc29jcyBiL2FyY2gvcmlzY3YvS2Nv
bmZpZy5zb2NzCj4gaW5kZXggYTljM2QyZjZkZWJjLi4xYmY1NjM3ZjI2MDEgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9LY29uZmlnLnNvY3MKPiArKysgYi9hcmNoL3Jpc2N2L0tjb25maWcuc29j
cwo+IEBAIC0xLDUgKzEsMTQgQEAKPiAgbWVudSAiU29DIHNlbGVjdGlvbiIKPgo+ICtjb25maWcg
QVJDSF9BTkRFUwo+ICsgICAgICAgYm9vbCAiQW5kZXMgU29DcyIKPiArICAgICAgIGRlcGVuZHMg
b24gTU1VICYmICFYSVBfS0VSTkVMCj4gKyAgICAgICBzZWxlY3QgRVJSQVRBX0FOREVTCj4gKyAg
ICAgICBzZWxlY3QgRVJSQVRBX0FOREVTX0NNTwo+ICsgICAgICAgc2VsZWN0IEFYNDVNUF9MMl9D
QUNIRQpEbyBhbGwgdGhlIEFuZGVzIFNvQ3MgcmVxdWlyZSBhbGwgdGhlIGFib3ZlIHRocmVlIGNv
bmZpZ3M/IChJZiBub3QgSQp3b3VsZCBhZGQgaXQgYmFzZWQgb24gdGhlIFNvQyB3aGljaCByZXF1
aXJlcyBpdC4pCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
