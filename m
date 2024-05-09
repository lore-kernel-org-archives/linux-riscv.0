Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83510C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JjbSou1f5O+1byLk+RsyZxZzvWWwgMdsr0IUr2mKqCc=; b=CsQeemK/lSA22a
	ftRutYDWmqKSv5MB2JoNp4MnOQgCnU6fqBU94H2LPhVVQcPrqj/hkS2g1YiDT1DKgWukE+8efwOQG
	FtR7iAxe3IRuVkJhyVqx5Xnrf2tmM8EvoyK2H266z+KavijMapMU0b3Q9s/oUbJAhGBWbLdP9l5R0
	3HeeRZd7ED+jUzyDYp7vIfSV1risIqV5I8vjRA3aQBCQp9//HZ+1I3qBOZnyHCIRQ5KyueaWHr4lB
	7CNtSadZGkB9ibcvNVJzzakC5lUfUc4XT740S0J0IwU73GMRtnu6VgOHgBG2tRfg/nG9Gbp5FYCjm
	bsYQ2/DKf5HT7Hr7hEFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BB1-00000002vjW-04C5;
	Thu, 09 May 2024 21:19:43 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5BAx-00000002vg7-1HBC
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 21:19:41 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-572aad902baso5071a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 14:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715289575; x=1715894375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aj/ruisSex0Kp0dBhUAYPvC4ARDFWMxrTjQLMO36++8=;
        b=dxBly3D/NqR2QKpjurgH4o4c749/BON3MJN76Jpg52ggRiiUi7Zs/HVWuR/LPiA+DD
         5KYyq8gNbe8hyRwPLPJcGVHF5BBp7NzHSJoGqeqZLbwlnJVi/Ixq5uYW9Pax19rab8Z5
         xP1EiYeNFwe3FgK51x7y/GpO0oo1CKMna9UuGsY6sC27M9JSHXC4+V7Hz6/8UK2Ve4n+
         asi5VqY9FyISlTp+MU8RaY+aD5BdVriIGWQ+094CbeBRb5wZbgokyDypQFdXMXrqmZHX
         IHGspaDT9Y8YH3szIW8L219TaJQY+Kb+r6ud15RD4QuH/HSJxq7zroA+Lc32hCfJm7fg
         o48w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715289575; x=1715894375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aj/ruisSex0Kp0dBhUAYPvC4ARDFWMxrTjQLMO36++8=;
        b=FkLanI9BDmLX3KPDDgiP2UUg6r/yiRQUXJC6xV+NtP8LeHLmVFNFvbwi7we6/3DQYX
         8s1+yVIZDrAvJKUzm5ev93mT8PVzOHMU3M156DXLM4LPKhLh+LCxb9TJo6v0rqlm4XgO
         HPsydCD/l1FKNJOjlxs7tC9T9ppH5AKHBAn8vx7Jj/zOP7zt4AtN+gMJE3Q86lb4E3f7
         tO5Eh5lupn7Bd3qJPr/y8cBI2OQ9jJog/GLjJsHxGHvEZD0sXLaSW6XHGHUcm/hZ/fYF
         QQVv2eakGzeRr4R5bqj5bKfMtaM/YI1h0XFpvkS5ukaRznJLb3C+uotorCu7TVZvC4BS
         3s8g==
X-Forwarded-Encrypted: i=1; AJvYcCUwu6Vj1TwYNLRvOJS0nqVc/0a3rlTjM3R2GMlD8vjvWdviUQFItYISKlz5FbQLTU6e0y+GRBmRCsYwDs5JT/qwJ/C9qtSp+DAPyj4XHjZS
X-Gm-Message-State: AOJu0Yww//IxoOsL+OlLTWBWx4tbIlJM5F4vHi4Bf8YEQeRngVnT3pOJ
	SpF9djCxVqXOj4wwJqVVmcCtHQGmXJQSUtRF+cQtyPNgyERyLNTx0bMWALPGQJNLdLe62EhSLkV
	EWuKdaM3TgIOagBik+noOdlNNgsrC1uRMFr3W
X-Google-Smtp-Source: AGHT+IGI4zzf79CVFYKmEZhPf2lhqJh1b8pYhjbZ5go+AXsEnSPUSUtKffiZRTXlmKPdbvdXpzTycKoV7ugVsV+l6ts=
X-Received: by 2002:a05:6402:222a:b0:572:554b:ec66 with SMTP id
 4fb4d7f45d1cf-57351ffc899mr8908a12.3.1715289570474; Thu, 09 May 2024 14:19:30
 -0700 (PDT)
MIME-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com> <20240509200022.253089-55-edliaw@google.com>
 <638a7831-493c-4917-9b22-5aa663e9ee84@efficios.com>
In-Reply-To: <638a7831-493c-4917-9b22-5aa663e9ee84@efficios.com>
From: Edward Liaw <edliaw@google.com>
Date: Thu, 9 May 2024 14:19:05 -0700
Message-ID: <CAG4es9UxSmaSdRU7T5q2t_TgOJg+=8UPf8xmTV5bhP6gbDwJuA@mail.gmail.com>
Subject: Re: [PATCH v3 54/68] selftests/rseq: Drop define _GNU_SOURCE
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: shuah@kernel.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_141939_395121_459325C1 
X-CRM114-Status: GOOD (  28.84  )
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

T24gVGh1LCBNYXkgOSwgMjAyNCBhdCAxOjE24oCvUE0gTWF0aGlldSBEZXNub3llcnMKPG1hdGhp
ZXUuZGVzbm95ZXJzQGVmZmljaW9zLmNvbT4gd3JvdGU6Cj4KPiBPbiAyMDI0LTA1LTA5IDE1OjU4
LCBFZHdhcmQgTGlhdyB3cm90ZToKPiA+IF9HTlVfU09VUkNFIGlzIHByb3ZpZGVkIGJ5IGxpYi5t
aywgc28gaXQgc2hvdWxkIGJlIGRyb3BwZWQgdG8gcHJldmVudAo+ID4gcmVkZWZpbml0aW9uIHdh
cm5pbmdzLgo+ID4KPiA+IEZpeGVzOiA4MDkyMTYyMzM1NTUgKCJzZWxmdGVzdHMvaGFybmVzczog
cmVtb3ZlIHVzZSBvZiBMSU5FX01BWCIpCj4KPiBUaGUgcGF0Y2ggcGVyIHNlIGxvb2tzIGZpbmUs
IGV4Y2VwdCBmb3IgdGhlICJGaXhlcyIgdGFnLgo+Cj4gQ29tbWl0IDgwOTIxNjIzMzU1NSBpbnRy
b2R1Y2VzIHVzZSBvZiBhc3ByaW50ZiBpbiBrc2VsZnRlc3RfaGFybmVzcy5oCj4gd2hpY2ggaXMg
dXNlZCBieSAoYWxsID8pIHNlbGZ0ZXN0cywgaW5jbHVkaW5nIHRoZSByc2VxIG9uZXMuIEhvd2V2
ZXIsCj4gdGhlIHJzZXEgc2VsZnRlc3RzIGVhY2ggaGF2ZSB0aGUgI2RlZmluZSBfR05VX1NPVVJD
RSwgd2hpY2ggd291bGQgaGF2ZQo+IGJlZW4gT0sgd2l0aG91dCB0aG9zZSBmdXJ0aGVyIGNoYW5n
ZXMuCj4KPiBTbyB0aGlzIHBhdGNoIGlzIG1vcmUgYWJvdXQgY29uc29saWRhdGluZyB3aGVyZSB0
aGUgX0dOVV9TT1VSQ0UgaXMKPiBkZWZpbmVkLCB3aGljaCBpcyBPSyB3aXRoIG1lLCBidXQgbm90
IHNvIG11Y2ggYWJvdXQgImZpeGluZyIgYW4KPiBpc3N1ZSB3aXRoIGNvbW1pdCA4MDkyMTYyMzM1
NTUuCj4KPiBBICJGaXgiIGlzIHNvbWV0aGluZyB0byBiZSBiYWNrcG9ydGVkIHRvIHN0YWJsZSBr
ZXJuZWxzLCBhbmQgSQo+IGRvbid0IHRoaW5rIHRoaXMgcGF0Y2ggcmVhY2hlcyB0aGF0IHRocmVz
aG9sZC4KPgo+IElmIGFueXRoaW5nLCB0aGlzIHBhdGNoIHJlbW92ZXMgYSB3YXJuaW5nIHRoYXQg
Z2V0cyBhZGRlZCBieQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyNDA1MDkyMDAw
MjIuMjUzMDg5LTEtZWRsaWF3QGdvb2dsZS5jb20vVC8jbWY4NDM4ZDAzZGU2ZTJiNjEzZGE0Zjg2
ZDRmNjBjNWZlMWM1Zjg0ODMKPiB3aXRoaW4gdGhlIHNhbWUgc2VyaWVzLgo+Cj4gQXJndWFibHks
IGVhY2ggI2RlZmluZSBfR05VX1NPVVJDRSBjb3VsZCBoYXZlIGJlZW4gZmlyc3QgcHJvdGVjdGVk
Cj4gYnkgYSAjaWZuZGVmIGd1YXJkIHRvIGVsaW1pbmF0ZSB0aGlzIHRyYW5zaWVudCB3YXJuaW5n
LCBhbmQgdGhlcmUKPiB3b3VsZCBiZSBub3RoaW5nIHRvICJmaXgiIGluIHRoaXMgY29uc29saWRh
dGlvbiBzZXJpZXMuCgpUaGF0IG1ha2VzIHNlbnNlLiAgSSBjYW4gcmVtb3ZlIHRoZSBmaXhlcyB0
YWdzLiAgODA5MjE2MjMzNTU1IHdpbGwKbGlrZWx5IGJlIHJldmVydGVkIGZpcnN0IGFueXdheSwg
YW5kIHlvdSdyZSByaWdodCB0aGF0IHRoZSBmb2N1cyBvZgp0aGlzIHBhdGNoIHNlcmllcyBpcyBv
biBjb25zb2xpZGF0aW5nIF9HTlVfU09VUkNFLgoKCj4KPiBUaG91Z2h0cyA/Cj4KPiBUaGFua3Ms
Cj4KPiBNYXRoaWV1Cj4KPiA+IFJldmlld2VkLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52
aWRpYS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogTXVoYW1tYWQgVXNhbWEgQW5qdW0gPHVzYW1hLmFu
anVtQGNvbGxhYm9yYS5jb20+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBFZHdhcmQgTGlhdyA8ZWRsaWF3
QGdvb2dsZS5jb20+Cj4gPiAtLS0KPiA+ICAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnNlcS9i
YXNpY19wZXJjcHVfb3BzX3Rlc3QuYyB8IDEgLQo+ID4gICB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9yc2VxL2Jhc2ljX3Rlc3QuYyAgICAgICAgICAgIHwgMiAtLQo+ID4gICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9yc2VxL3BhcmFtX3Rlc3QuYyAgICAgICAgICAgIHwgMSAtCj4gPiAgIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL3JzZXEvcnNlcS5jICAgICAgICAgICAgICAgICAgfCAyIC0tCj4g
PiAgIDQgZmlsZXMgY2hhbmdlZCwgNiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnNlcS9iYXNpY19wZXJjcHVfb3BzX3Rlc3QuYyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JzZXEvYmFzaWNfcGVyY3B1X29wc190ZXN0LmMKPiA+IGlu
ZGV4IDIzNDhkMmMyMGQwYS4uNTk2MWMyNGVlMWFlIDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVz
dGluZy9zZWxmdGVzdHMvcnNlcS9iYXNpY19wZXJjcHVfb3BzX3Rlc3QuYwo+ID4gKysrIGIvdG9v
bHMvdGVzdGluZy9zZWxmdGVzdHMvcnNlcS9iYXNpY19wZXJjcHVfb3BzX3Rlc3QuYwo+ID4gQEAg
LTEsNSArMSw0IEBACj4gPiAgIC8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBMR1BMLTIuMQo+
ID4gLSNkZWZpbmUgX0dOVV9TT1VSQ0UKPiA+ICAgI2luY2x1ZGUgPGFzc2VydC5oPgo+ID4gICAj
aW5jbHVkZSA8cHRocmVhZC5oPgo+ID4gICAjaW5jbHVkZSA8c2NoZWQuaD4KPiA+IGRpZmYgLS1n
aXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yc2VxL2Jhc2ljX3Rlc3QuYyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3JzZXEvYmFzaWNfdGVzdC5jCj4gPiBpbmRleCAyOTVlZWExNjQ2NmYu
LjFmZWQ3NDliNGJkNyAxMDA2NDQKPiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jz
ZXEvYmFzaWNfdGVzdC5jCj4gPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yc2VxL2Jh
c2ljX3Rlc3QuYwo+ID4gQEAgLTIsOCArMiw2IEBACj4gPiAgIC8qCj4gPiAgICAqIEJhc2ljIHRl
c3QgY292ZXJhZ2UgZm9yIGNyaXRpY2FsIHJlZ2lvbnMgYW5kIHJzZXFfY3VycmVudF9jcHUoKS4K
PiA+ICAgICovCj4gPiAtCj4gPiAtI2RlZmluZSBfR05VX1NPVVJDRQo+ID4gICAjaW5jbHVkZSA8
YXNzZXJ0Lmg+Cj4gPiAgICNpbmNsdWRlIDxzY2hlZC5oPgo+ID4gICAjaW5jbHVkZSA8c2lnbmFs
Lmg+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvcnNlcS9wYXJhbV90
ZXN0LmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9yc2VxL3BhcmFtX3Rlc3QuYwo+ID4gaW5k
ZXggMmYzNzk2MTI0MGNhLi40OGE1NWQ5NGViNzIgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9yc2VxL3BhcmFtX3Rlc3QuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvcnNlcS9wYXJhbV90ZXN0LmMKPiA+IEBAIC0xLDUgKzEsNCBAQAo+ID4gICAvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTEdQTC0yLjEKPiA+IC0jZGVmaW5lIF9HTlVfU09VUkNF
Cj4gPiAgICNpbmNsdWRlIDxhc3NlcnQuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L21lbWJhcnJp
ZXIuaD4KPiA+ICAgI2luY2x1ZGUgPHB0aHJlYWQuaD4KPiA+IGRpZmYgLS1naXQgYS90b29scy90
ZXN0aW5nL3NlbGZ0ZXN0cy9yc2VxL3JzZXEuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3Jz
ZXEvcnNlcS5jCj4gPiBpbmRleCA5NmU4MTJiZGY4YTQuLjg4NjAyODg5NDE0YyAxMDA2NDQKPiA+
IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3JzZXEvcnNlcS5jCj4gPiArKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9yc2VxL3JzZXEuYwo+ID4gQEAgLTE0LDggKzE0LDYgQEAKPiA+
ICAgICogTUVSQ0hBTlRBQklMSVRZIG9yIEZJVE5FU1MgRk9SIEEgUEFSVElDVUxBUiBQVVJQT1NF
LiBTZWUgdGhlIEdOVQo+ID4gICAgKiBMZXNzZXIgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3Ig
bW9yZSBkZXRhaWxzLgo+ID4gICAgKi8KPiA+IC0KPiA+IC0jZGVmaW5lIF9HTlVfU09VUkNFCj4g
PiAgICNpbmNsdWRlIDxlcnJuby5oPgo+ID4gICAjaW5jbHVkZSA8c2NoZWQuaD4KPiA+ICAgI2lu
Y2x1ZGUgPHN0ZGlvLmg+Cj4KPiAtLQo+IE1hdGhpZXUgRGVzbm95ZXJzCj4gRWZmaWNpT1MgSW5j
Lgo+IGh0dHBzOi8vd3d3LmVmZmljaW9zLmNvbQo+CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
