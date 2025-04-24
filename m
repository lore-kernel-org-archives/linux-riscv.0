Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D85EC369C2
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 18:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXtsKSk9rikb7TcToFKUYFBLvnAj/mg4u/stcKjh8P8=; b=QI0PugnZOqpQb2ZyWxFCP2q1+u
	IJ2A7KRtuinSIgONpHc5HvNCm1CusVFM2PbrQe7tM1vlteayo1GpfJ6xLTRRCJ3p1hJ82spoz2MiK
	dajZf5G1rIZCcl7zG9MydSq8+3J7GRXpNiCdCjN4SMpB1KWiaXKhBOvFLFMXX4Sqf+yRiZXYZ7Rs8
	iov8XiDQWmsWqAjM/APhMuKZpAPp2yweCjw2WQsKHKZwF7ImgKszfXjGmRkwGxU2YEvFqz12J5xna
	iTW5xqjeszuab2HCfaR3XN/kVTadtWikIVFnkFS8tzpvLZY1XaS4WWGOgX+7ET6fOvcMpOAWZpbkC
	IXF+p/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u817a-0000000EzHu-1kSX;
	Thu, 24 Apr 2025 18:16:26 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u817Y-0000000EzHA-2Dgj
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 18:16:26 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736b0c68092so1161783b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 24 Apr 2025 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745518583; x=1746123383; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9sHYezjUq6l/x/6C81DhRiO6Hkx3zNHx6RVEna5xiI=;
        b=CBaSq4HliT4YSEaKnHB7+E8tMyohmGtBl+LXhyzzishCJZQiBaN4ju348FXwoqA4AU
         Hg1o2DeIkJMcDQRK1qWy03a8iMfva3LFFvARDiou3gWNDEkvRbWeRXAYMluJgKq7e5iv
         GDAfcDQyklRkA8qWTVZrmNLhTQeL8lSrN+BZruvw4BitBrcFlH2014N/hgpfAcjuSWnI
         FqZ0AUL8VrWfSFXD63wv+Lf1iIMSXV3yNhzEIscLcZWTJ/M4SOLqUio0A3gyKBGvg5s4
         ULO3H8tB5KxhvGS9QsYAUZ/mR5WAkX9Qy0riBzXP6xJuM3ewHvOPxbHGHb/W1zC78Ieg
         x6hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745518583; x=1746123383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9sHYezjUq6l/x/6C81DhRiO6Hkx3zNHx6RVEna5xiI=;
        b=bFP8jg3xCHZBEibEhgeRWI5uNbr0GWni/4NA5CleXI/PcHlnAHzYklOTMpO5ev27j0
         UeeKXtubi7BUfgsL3kMsNF+Bn3d6Uz1P3zYGwRiLXDW29KekA9r1XjR2IIhG6lgXLDsJ
         M+Suan9VcHEfdO10w7uzuMYRAFnPmyyhiMgY6PC60WuxnzvVC0usGkk4537uAh56W8w0
         Xnano2v0xbqSSqb0aHAo8RyTzPNTC9483f1m0uHx3DXRLqXBMzCEYQQpdLA0dF2+jeJh
         0kHKh2DzP/B50LU0tPDZxbTDDI4RLddb+QS8VNIGB3hJsip91H/uSrrEvtFDvdtTarS7
         Vc6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVh4ZpqG7xQn/0KWtntxBmv12qOZz69a5M9SH3fOogYpzIIahypIXGs9CyUUiffmqv8xJh2Af8z56zS+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmA1Gx/fj6bzjn3fZaBsadCV8AmwxtpXAm5U9ZkRvQIPh5dZ96
	EXgtjIu5jAp9p/gSwaDag92RfHDgpc7V4T9s8beip2YYlIogM/TkmQt7Qo4nT5o=
X-Gm-Gg: ASbGnctmrL0jW1chX4japjss0UPVcuFQdKdEqfOhS218cBxmNes7SI2dq5uMpuRK4e0
	jK60Iho1sTrLwTCfbFDF195BoZGnnckYexSkGoFErkENl4WmEcPweuX1nAK8onMklSvxc/X7SIl
	p+z5tFiIuhCO29nAZwTJn7FtitiwfrmkQw9PfyJXFwVVXLgoacjwUDX/uWB6I9LNPUb3gPC/xFz
	3u3Czb1MNV0YuQE+an4gw1T5yqJRa2SgXuiJmP8La/CIGSP26nPA47hjSxggatnOWJOfgRfHBjO
	apiDsTv+Tch1TgWp6QAIpXet/gqLafqa3l4l0+bZqClDo0GZ0N8=
X-Google-Smtp-Source: AGHT+IF0jVzUPU4VWGuVNQ17BhULhOztKBekv2BW5HkIJsQ1IRCAo1z8B5DG3h77AtgqUMysW+802Q==
X-Received: by 2002:aa7:9315:0:b0:736:9e40:13b1 with SMTP id d2e1a72fcca58-73e24ae7b45mr5236452b3a.23.1745518583417;
        Thu, 24 Apr 2025 11:16:23 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259414c7sm1783697b3a.62.2025.04.24.11.16.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 11:16:23 -0700 (PDT)
Date: Thu, 24 Apr 2025 11:16:19 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Brauner <brauner@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	alistair.francis@wdc.com, richard.henderson@linaro.org,
	jim.shu@sifive.com, andybnac@gmail.com, kito.cheng@sifive.com,
	charlie@rivosinc.com, atishp@rivosinc.com, evan@rivosinc.com,
	cleger@rivosinc.com, alexghiti@rivosinc.com,
	samitolvanen@google.com, broonie@kernel.org,
	rick.p.edgecombe@intel.com,
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH v12 12/28] riscv: Implements arch agnostic shadow stack
 prctls
Message-ID: <aAp_87-Xr6gn_hD7@debug.ba.rivosinc.com>
References: <20250314-v5_user_cfi_series-v12-0-e51202b53138@rivosinc.com>
 <20250314-v5_user_cfi_series-v12-12-e51202b53138@rivosinc.com>
 <D92V2NPNZYV0.136MJ2HOK48HE@ventanamicro.com>
 <aAnBmexbL4XmVxQk@debug.ba.rivosinc.com>
 <D9EWR3RQK0FD.3GF55KNS53YSR@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D9EWR3RQK0FD.3GF55KNS53YSR@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_111624_571652_2345BC54 
X-CRM114-Status: GOOD (  38.81  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBBcHIgMjQsIDIwMjUgYXQgMDM6MzY6NTRQTSArMDIwMCwgUmFkaW0gS3LEjW3DocWZ
IHdyb3RlOgo+MjAyNS0wNC0yM1QyMTo0NDowOS0wNzowMCwgRGVlcGFrIEd1cHRhIDxkZWJ1Z0By
aXZvc2luYy5jb20+Ogo+PiBPbiBUaHUsIEFwciAxMCwgMjAyNSBhdCAxMTo0NTo1OEFNICswMjAw
LCBSYWRpbSBLcsSNbcOhxZkgd3JvdGU6Cj4+PjIwMjUtMDMtMTRUMTQ6Mzk6MzEtMDc6MDAsIERl
ZXBhayBHdXB0YSA8ZGVidWdAcml2b3NpbmMuY29tPjoKPj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9pbmNsdWRlL2FzbS91c2VyY2ZpLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3VzZXJj
ZmkuaAo+Pj4+IEBAIC0xNCw3ICsxNSw4IEBAIHN0cnVjdCBrZXJuZWxfY2xvbmVfYXJnczsKPj4+
PiAgc3RydWN0IGNmaV9zdGF0dXMgewo+Pj4+ICAJdW5zaWduZWQgbG9uZyB1YmNmaV9lbiA6IDE7
IC8qIEVuYWJsZSBmb3IgYmFja3dhcmQgY2ZpLiAqLwo+Pj4+IC0JdW5zaWduZWQgbG9uZyByc3Zk
IDogKChzaXplb2YodW5zaWduZWQgbG9uZykgKiA4KSAtIDEpOwo+Pj4+ICsJdW5zaWduZWQgbG9u
ZyB1YmNmaV9sb2NrZWQgOiAxOwo+Pj4+ICsJdW5zaWduZWQgbG9uZyByc3ZkIDogKChzaXplb2Yo
dW5zaWduZWQgbG9uZykgKiA4KSAtIDIpOwo+Pj4KPj4+VGhlIHJzdmQgZmllbGQgc2hvdWxkbid0
IGJlIG5lY2Vzc2FyeSBhcyB0aGUgY29udGFpbmVyIGZvciB0aGUgYml0ZmllbGQKPj4+aXMgJ3Vu
c2lnbmVkIGxvbmcnIHNpemVkLgo+Pj4KPj4+V2h5IGRvbid0IHdlIHVzZSBib29scyBoZXJlLCB0
aG91Z2g/Cj4+Pkl0IG1pZ2h0IHByb2R1Y2UgYSBiZXR0ZXIgYmluYXJ5IGFuZCB3ZSdyZSBub3Qg
aHVydGluZyBmb3Igc3RydWN0IHNpemUuCj4+Cj4+IElmIHlvdSByZW1lbWJlciBvbmUgb2YgdGhl
IHByZXZpb3VzIHBhdGNoIGRpc2N1c3Npb24sIHRoaXMgZ29lcyBpbnRvCj4+IGB0aHJlYWRfaW5m
b2AgRG9uJ3Qgd2FudCB0byBibG9hdCBpdC4gRXZlbiBpZiB3ZSBlbmQgc2hvdmluZyBpbnRvIHRh
c2tfc3RydWN0LAo+PiBkb24ndCB3YW50IHRvIGJsb2F0IHRoYXQgZWl0aGVyLiBJIGNhbiBqdXN0
IGNvbnZlcnQgaXQgaW50byBiaXRtYXNrIGlmCj4+IGJpdGZpZWxkcyBhcmUgYW4gZXllc29yZSBo
ZXJlLgo+Cj4gICJ1bnNpZ25lZCBsb25nIHJzdmQgOiAoKHNpemVvZih1bnNpZ25lZCBsb25nKSAq
IDgpIC0gMik7Igo+Cj5pcyBhbiBleWVzb3JlIHRoYXQgZGVmaW5lcyBleGFjdGx5IHRoZSBzYW1l
IGFzIHRoZSB0d28gbGluZXMgYWxvbmUKPgo+ICB1bnNpZ25lZCBsb25nIHViY2ZpX2VuIDogMTsK
PiAgdW5zaWduZWQgbG9uZyB1YmNmaV9sb2NrZWQgOiAxOwo+Cj5UaGF0IG9uZSBzaG91bGQgYmUg
cmVtb3ZlZC4KPgo+SWYgd2UgaGF2ZSBvbmx5IDQgYml0cyBpbiA0LzggYnl0ZXMsIHRoZW4gYml0
ZmllbGRzIGRvIGdlbmVyYXRlIHdvcnNlCj5jb2RlIHRoYW4gNCBib29scyBhbmQgYSAwLzQgYnl0
ZSBob2xlLiAgVGhlIHN0cnVjdCBzaXplIHN0YXlzIHRoZSBzYW1lLgo+Cj5JIGRvbid0IGNhcmUg
bXVjaCBhYm91dCB0aGUgc3dpdGNoIHRvIGJvb2xzLCB0aG91Z2gsIGJlY2F1c2UgdGhpcyBjb2Rl
Cj5pcyBub3QgY2FsbGVkIG9mdGVuLgoKSSdsbCByZW1vdmUgdGhlIGJpdGZpZWxkcywgaGF2ZSBz
aW5nbGUgYHVuc2lnbmVkIGxvbmcgY2ZpX2NvbnRyb2xfc3RhdGVgCkFuZCBkbyBgI2RlZmluZSBS
SVNDVl9VQkNGSV9FTiAxYCBhbmQgc28gb24uCj4KPj4+PiBAQCAtMjYyLDMgKzI5Miw4MyBAQCB2
b2lkIHNoc3RrX3JlbGVhc2Uoc3RydWN0IHRhc2tfc3RydWN0ICp0c2spCj4+Pj4gK2ludCBhcmNo
X3NldF9zaGFkb3dfc3RhY2tfc3RhdHVzKHN0cnVjdCB0YXNrX3N0cnVjdCAqdCwgdW5zaWduZWQg
bG9uZyBzdGF0dXMpCj4+Pj4gK3sKPj4+PiArCS8qIFJlcXVlc3QgaXMgdG8gZW5hYmxlIHNoYWRv
dyBzdGFjayBhbmQgc2hhZG93IHN0YWNrIGlzIG5vdCBlbmFibGVkIGFscmVhZHkgKi8KPj4+PiAr
CWlmIChlbmFibGVfc2hzdGsgJiYgIWlzX3Noc3RrX2VuYWJsZWQodCkpIHsKPj4+PiArCQkvKiBz
aGFkb3cgc3RhY2sgd2FzIGFsbG9jYXRlZCBhbmQgZW5hYmxlIHJlcXVlc3QgYWdhaW4KPj4+PiAr
CQkgKiBubyBuZWVkIHRvIHN1cHBvcnQgc3VjaCB1c2VjYXNlIGFuZCByZXR1cm4gRUlOVkFMLgo+
Pj4+ICsJCSAqLwo+Pj4+ICsJCWlmIChpc19zaHN0a19hbGxvY2F0ZWQodCkpCj4+Pj4gKwkJCXJl
dHVybiAtRUlOVkFMOwo+Pj4+ICsKPj4+PiArCQlzaXplID0gY2FsY19zaHN0a19zaXplKDApOwo+
Pj4+ICsJCWFkZHIgPSBhbGxvY2F0ZV9zaGFkb3dfc3RhY2soMCwgc2l6ZSwgMCwgZmFsc2UpOwo+
Pj4KPj4+V2h5IGRvbid0IHdlIHVzZSB0aGUgdXNlcnNwYWNlLWFsbG9jYXRlZCBzdGFjaz8KPj4+
Cj4+PkknbSBjb21wbGV0ZWx5IG1pc3NpbmcgdGhlIGRlc2lnbiBpZGVhIGhlcmUuLi4gIFVzZXJz
cGFjZSBoYXMgYWJzb2x1dGUKPj4+b3ZlciB0aGUgc2hhZG93IHN0YWNrIHBvaW50ZXIgQ1NSLCBz
byB3ZSBkb24ndCBuZWVkIHRvIGRvIG11Y2ggaW4gTGludXg6Cj4+Pgo+Pj4xLiBpbnRlcmZhY2Ug
dG8gc2V0IHVwIHBhZ2UgdGFibGVzIHdpdGggLVctIFBURSBhbmQKPj4+Mi4gaW50ZXJmYWNlIHRv
IGNvbnRyb2wgc2VudmNmZy5TU0UuCj4+Pgo+Pj5Vc2Vyc3BhY2UgY2FuIGRvIHRoZSByZXN0Lgo+
Pgo+PiBEZXNpZ24gaXMgbGlrZSBmb2xsb3dpbmc6Cj4+Cj4+IFdoZW4gYSB1c2VyIHRhc2sgd2Fu
dHMgdG8gZW5hYmxlIHNoYWRvdyBzdGFjayBmb3IgaXRzZWxmLCBpdCBoYXMgdG8gaXNzdWUKPj4g
YSBzeXNjYWxsIHRvIGtlcm5lbCAobGlrZSB0aGlzIHByY3RsKS4gTm93IGl0IGNhbiBiZSBkb25l
IGluZGVwZW5kZW50bHkgYnkKPj4gdXNlciB0YXNrIGJ5IGZpcnN0IGlzc3VpbmcgYG1hcF9zaGFk
b3dfc3RhY2tgLCB0aGVuIGFza2luZyBrZXJuZWwgdG8gbGlnaHQKPj4gdXAgZW52Y2ZnIGJpdCBh
bmQgZXZlbnR1YWxseSB3aGVuIHJldHVybiB0byB1c2VybW9kZSBoYXBwZW5zLCBpdCBjYW4gd3Jp
dGUKPj4gdG8gQ1NSLiBJdCBpcyBubyBkaWZmZXJlbnQgZnJvbSBkb2luZyBhbGwgb2YgdGhlIGFi
b3ZlIHRvZ2V0aGVyIGluIHNpbmdsZQo+PiBgcHJjdGxgIGNhbGwuIFRoZXkgYXJlIGVxdWl2YWxl
bnQgaW4gdGhhdCBuYXR1cmUuCj4+Cj4+IEJhY2tncm91bmQgaXMgdGhhdCB4ODYgZm9sbG93ZWQg
dGhpcyBiZWNhdXNlIHg4NiBoYWQgd29ya2xvYWRzL2JpbmFyaWVzLwo+PiBmdW5jdGlvbnMgd2l0
aCAoZGVlcClyZWN1cnNpdmUgZnVuY3Rpb25zIGFuZCB0aHVzIGJ5IGRlZmF1bHQgd2VyZSBmb3Jj
ZWQKPj4gdG8gYWx3YXlzIGFsbG9jYXRlIHNoYWRvdyBzdGFjayB0byBiZSBvZiB0aGUgc2FtZSBz
aXplIGFzIGRhdGEgc3RhY2suIFRvCj4+IHJlZHVjZSBidXJkZW4gb24gdXNlcnNwYWNlIGZvciBk
ZXRlcm1pbmluZyBhbmQgdGhlbiBhbGxvY2F0aW5nIHNhbWUgc2l6ZQo+PiAoc2l6ZSBvZiBkYXRh
IHN0YWNrKSBzaGFkb3cgc3RhY2ssIHByY3RsIHdvdWxkIGRvIHRoZSBqb2Igb2YgY2FsY3VsYXRp
bmcKPj4gZGVmYXVsdCBzaGFkb3cgc3RhY2sgc2l6ZSAoYW5kIHJlZHVjZSBwcm9ncmFtbWluZyBl
cnJvciBpbiB1c2VybW9kZSkuIGFybTY0Cj4+IGZvbGxvd2VkIHRoZSBzdWl0ZS4gSSBkb24ndCB3
YW50IHRvIGZpbmQgb3V0IHdoYXQncyB0aGUgY29tcGF0aWJsaXR5IGlzc3Vlcwo+PiB3ZSB3aWxs
IHNlZSBhbmQgdGh1cyBqdXN0IGZvbGxvd2luZyB0aGUgc3VpdGUgKGdpdmVuIHRoYXQgYm90aCBh
cHByb2FjaGVzCj4+IGFyZSBlcXVpdmFsZW50KS4gVGFrZSBhIGxvb2sgYXQgc3RhdGljIGBjYWxj
X3Noc3RrX3NpemUodW5zaWduZWQgbG9uZyBzaXplKWAuCj4+Cj4+IENvbWluZyBiYWNrIHRvIHlv
dXIgcXVlc3Rpb24gb2Ygd2h5IG5vdCBhbGxvd2luZyB1c2Vyc3BhY2UgdG8gbWFuYWdlIGl0cwo+
PiBvd24gc2hhZG93IHN0YWNrLiBBbnN3ZXIgaXMgdGhhdCBpdCBjYW4gbWFuYWdlIGl0cyBvd24g
c2hhZG93IHN0YWNrLiBJZiBpdAo+PiBkb2VzLCBpdCBqdXN0IGhhdmUgdG8gYmUgYXdhcmUgb2Yg
c2l6ZSBpdHMgYWxsb2NhdGluZyBmb3Igc2hhZG93IHN0YWNrLgo+Cj5JdCdzIGp1c3QgdGhhdCB1
c2Vyc3BhY2UgY2Fubm90IHByZXZlbnQgYWxsb2NhdGlvbiBvZiB0aGUgZGVmYXVsdCBzdGFjawo+
d2hlbiBlbmFibGluZyBpdCwgd2hpY2ggaXMgdGhlIHdlaXJkIHBhcnQgdG8gbWUuCj5UaGUgYWxs
b2NhdGUgYW5kIGVuYWJsZSBzeXNjYWxscyBjb3VsZCBoYXZlIGJlZW4gbmljZWx5IGNvbXBvc2Fi
bGUuCj4KPj4gVGhlcmUgaXMgYWxyZWFkeSBhIHBhdGNoIHNlcmllcyBnb2luZyBvbiB0byBtYW5h
Z2UgdGhpcyB1c2luZyBjbG9uZTMuCj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1
MDQwOC1jbG9uZTMtc2hhZG93LXN0YWNrLXYxNS00LTNmYTI0NWM2ZTNiZUBrZXJuZWwub3JnLwo+
Cj5BIG5ldyBpb2N0bCBkb2VzIHNlZW0gdG8gc29sdmUgbW9zdCBvZiB0aGUgcHJhY3RpY2FsIGlz
c3VlcywgdGhhbmtzLgo+Cj4+IEkgZnVsbHkgZXhwZWN0IGdyZWVuIHRocmVhZCBpbXBsZW1lbnRh
dGlvbnMgaW4gcnVzdC9nbyBvciBzd2FwY29udGV4dAo+PiBiYXNlZCB0aHJlYWQgbWFuYWdlbWVu
dCBkb2luZyB0aGlzIG9uIHRoZWlyIG93bi4KPj4KPj4gQ3VycmVudCBkZXNpZ24gaXMgdG8gZW5z
dXJlIGV4aXN0aW5nIGFwcHMgZG9udCBoYXZlIHRvIGNoYW5nZSBhIGxvdCBpbgo+PiB1c2Vyc3Bh
Y2UgYW5kIGJ5IGRlZmF1bHQga2VybmVsIGdpdmVzIGNvbXBhdGliaWxpdHkuIEFueW9uZSBlbHNl
IHdhbnRpbmcKPj4gdG8gb3B0aW1pemUgdGhlIHVzYWdlIG9mIHNoYWRvdyBzdGFjayBjYW4gZG8g
c28gd2l0aCBjdXJyZW50IGRlc2lnbi4KPgo+UmlnaHQsIGNoYW5naW5nIHJsaW1pdF9zdGFjayBh
cm91bmQgc2hhZG93IHN0YWNrIGFsbG9jYXRpb24gaXMgbm90IHRoZQo+bW9zdCBlbGVnYW50IHdh
eSwgYnV0IGl0IGRvZXMgd29yay4KPgo+Pj4+ICtpbnQgYXJjaF9sb2NrX3NoYWRvd19zdGFja19z
dGF0dXMoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAo+Pj4+ICsJCQkJICB1bnNpZ25lZCBsb25n
IGFyZykKPj4+PiArewo+Pj4+ICsJLyogSWYgc2h0c3RrIG5vdCBzdXBwb3J0ZWQgb3Igbm90IGVu
YWJsZWQgb24gdGFzaywgbm90aGluZyB0byBsb2NrIGhlcmUgKi8KPj4+PiArCWlmICghY3B1X3N1
cHBvcnRzX3NoYWRvd19zdGFjaygpIHx8Cj4+Pj4gKwkgICAgIWlzX3Noc3RrX2VuYWJsZWQodGFz
aykgfHwgYXJnICE9IDApCj4+Pj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4+Pgo+Pj5UaGUgdGFzayBt
aWdodCB3YW50IHRvIHByZXZlbnQgc2hhZG93IHN0YWNrIGZyb20gYmVpbmcgZW5hYmxlZD8KPj4K
Pj4gQnV0IFdoeSB3b3VsZCBpdCB3YW50IHRvIGRvIHRoYXQ/IFRhc2sgY2FuIHNpbXBseSBub3Qg
aXNzdWUgdGhlIHByY3RsLiBUaGVyZQo+PiBhcmUgZ2xpYmMgdHVuYWJsZXMgYXMgd2VsbCB1c2lu
ZyB3aGljaCBpdCBjYW4gYmUgZGlzYWJsZWQuCj4KPlRoZSB0YXNrIG1pZ2h0IGRvIGl0IGFzIHNv
bWUgbGFzdCByZXNvcnQgdG8gcHJldmVudCBhIGJ1Z2d5IGNvZGUgZnJvbQo+ZW5hYmxpbmcgc2hh
ZG93IHN0YWNrcyB0aGF0IHdvdWxkIGp1c3QgY3Jhc2guICBPciB3aGF0ZXZlciBjb21wbGljYXRl
ZAo+cmVhc29uIHVzZXJzcGFjZSBjYW4gdGhpbmsgb2YuCj4KPkl0J3MgbW9yZSB0aGUgb3RoZXIg
d2F5IGFyb3VuZC4gIEkgd29uZGVyIHdoeSB3ZSdyZSByZW1vdmluZyB0aGlzIG9wdGlvbgo+d2hl
biB3ZSBkb24ndCByZWFsbHkgY2FyZSB3aGF0IHVzZXJzcGFjZSBkb2VzIHRvIGl0c2VsZi4KPkkg
dGhpbmsgaXQncyBjb21wbGljYXRpbmcgdGhlIGtlcm5lbCB3aXRob3V0IGFuIG9idmlvdXMgZ2Fp
bi4KCkl0IGp1c3QgZmVlbHMgd2llcmQuIFRoZXJlIGlzbid0IGFueXRoaW5nIGxpa2UgdGhpcyBm
b3Igb3RoZXIgZmVhdHVyZXMgbGl0LXVwCnZpYSBlbnZjZmcuIERvZXMgaHdwcm9iZSBhbGxvdyB0
aGlzIG9uIHBlci10YXNrIGJhc2lzPyBJJ2xsIGxvb2sgaW50byBpdC4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
