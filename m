Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E59C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRlrVsnb88W6BATcGnp1u5UR3QLEZ0RGHgOjj+rfprw=; b=l9f9L0dnS5cqPQ
	PDysNcnpUr+bCcYwUXWgiT824czKJKhx3acVzNpMi6IsBuSwWJJqr1S7+oJXIyX6mJgL8jv6L2EHT
	krF3rqwevu3F8hmW4nt9eJ3kFL8v2+SW6IQF7p9ejFFJq6e4bzqdpdwoJnU0H5FsrlzuRlT5phlHv
	NLDLhjjwsJoJCXsWqcKUPufjmzKBBdxlBlLSNJdMlavPq9jZfWSYL8TOsJ+hDcbwCrqSQcuiE4PrH
	pAWGb3/r2iwBgbW/Bj/hqUSIHNET58oCQwE9JXTg+Qae5/Ls+zD30iz9xccv0oY5JjXRavf9Qq27w
	apV/8kUUNxK455RBdt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CjF-00000003CmN-33VO;
	Thu, 09 May 2024 22:59:09 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CjD-00000003Cli-07hx
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 22:59:08 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-572f6c56cdaso7088a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 15:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715295543; x=1715900343; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y1vau91hxBMnWZHVkH054+8jTk5Pa/DNJnVVz4HmL40=;
        b=19McdT1+Gw5AYQoxuOjjnO0q1A37y+MSZpixRAz5ovk5hMiyUUFlzDVtzAsaPLTawc
         ioYQa/2O5+IA/RvAV26IOBY9SdUDIkvIc1wXAe8S3Oe/aDGRZ2KdWyQAg/+Q9oF7/9l/
         0ClNiqLx8XLmKQ/3H/1GosnPfUU9mb0zjdO42Nx57hTGvzMo8fopfy/pu7xPZHRj/2wp
         SyPLbH5YeEdAj3uXVD1BDOj5kR9aXCW/q3iru6+b85DJu69NezUjvNOZUF3A6vNJOMe6
         17SrZM81HvkGu5OILpmvekTCzZa+noQIVzvqtpqP51lB2S8VzNtCAwL/ZGUI3UZdUaO4
         0Ehg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715295543; x=1715900343;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1vau91hxBMnWZHVkH054+8jTk5Pa/DNJnVVz4HmL40=;
        b=FK0X6KChrahmKQvoz1xulQJK6mymoXCcvd52UVaC2ScsMJrDggf2JRdLuFA4C+NZV+
         vXoYwjrsLbvB5OSlC2mtyI+xDIcDciBqS0tAPGbzyHFq4T2FmDyNFtsdiz5gbdN6QCQo
         uiV55X0uJjB7NlAQHReanql9X4J3XMOKtJLRGX5v7eDHVxQ9eyoaai6kdKFoq6BTMlPz
         P9CtLWPSjBWfxFq9WqbXKqaAJZzCBKwT+DFoc0ZRzhlHvAwy6em/YaAdQyo8Wtv2Y5np
         Oexke60Myx1Mn+xGuqELoZGFUM1vkOaUvtUJ8jL0YO9X9Ze2F5vDHTfmXS6o+Hyj8wlj
         DthA==
X-Forwarded-Encrypted: i=1; AJvYcCU/YFa3YvCAKr//h2iGDM4du+MT4yQbBDUTj8/S7/9SGq7uyK/AkiqJgbj+BxPy2hFzlE8GqXYUiitnXK5/2/r18AMQR9JB/Su7iVjVZZFD
X-Gm-Message-State: AOJu0YzsvmZQ+GSxLAQwSuhMiF0Z0l7ezWIVnoEDBu+1Mx8alSrBnnrL
	RAq8DPmBZDeSUDfZqV7tJ/ZxExlPnnfDIEDBx/yrn0U258R6BW953DZrOiWWuiAzdsZXlnFdSVT
	7M03Uu60cKfsbFYO4JD6keKK3L9E2Dc2FWmfI
X-Google-Smtp-Source: AGHT+IHuVFTFisfvrt55ub+8UO4+Id1LOVWeasU97gGretbq/QA6WW4CiikvBa7AfpTXmMMad1SbRPJ/2IdczDaT84s=
X-Received: by 2002:a50:8d84:0:b0:572:e6fb:ab07 with SMTP id
 4fb4d7f45d1cf-5735203906fmr30811a12.7.1715295542981; Thu, 09 May 2024
 15:59:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com> <20240509200022.253089-4-edliaw@google.com>
 <0e196143-c0bf-4d70-9735-7e6d9a69ea8f@nvidia.com>
In-Reply-To: <0e196143-c0bf-4d70-9735-7e6d9a69ea8f@nvidia.com>
From: Edward Liaw <edliaw@google.com>
Date: Thu, 9 May 2024 15:58:35 -0700
Message-ID: <CAG4es9Xv0Pwst+b0mre2g+QkBGoQS0cWj4xizRt+cHFJ0BTDaQ@mail.gmail.com>
Subject: Re: [PATCH v3 03/68] selftests: Compile with -D_GNU_SOURCE when
 including lib.mk
To: John Hubbard <jhubbard@nvidia.com>
Cc: shuah@kernel.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	Christian Brauner <brauner@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kernel-team@android.com, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_155907_116242_4B8410E6 
X-CRM114-Status: GOOD (  25.23  )
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

T24gVGh1LCBNYXkgOSwgMjAyNCBhdCAyOjI14oCvUE0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPiB3cm90ZToKPgo+IE9uIDUvOS8yNCAxMjo1NyBQTSwgRWR3YXJkIExpYXcgd3Jv
dGU6Cj4gPiBsaWIubWsgd2lsbCBhZGQgLURfR05VX1NPVVJDRSB0byBDRkxBR1MgYnkgZGVmYXVs
dC4gIFRoaXMgd2lsbCBtYWtlIGl0Cj4gPiB1bm5lY2Vzc2FyeSB0byBhZGQgI2RlZmluZSBfR05V
X1NPVVJDRSBpbiB0aGUgc291cmNlIGNvZGUuCj4gPgo+ID4gRml4ZXM6IDgwOTIxNjIzMzU1NSAo
InNlbGZ0ZXN0cy9oYXJuZXNzOiByZW1vdmUgdXNlIG9mIExJTkVfTUFYIikKPiA+IFN1Z2dlc3Rl
ZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogRWR3YXJkIExpYXcgPGVkbGlhd0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgIHRvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL01ha2VmaWxlIHwgNCArKy0tCj4gPiAgIHRvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2xpYi5tayAgIHwgNSArKysrLQo+ID4gICAyIGZpbGVzIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiA+Cj4KPiBIaSBFZHdhcmQsCj4KPiBUaGlzIGxvb2tz
IGdvb2QsIHdpdGggb25lIHNtYWxsIHJlZmFjdG9yaW5nIG9wcG9ydHVuaXR5IHJlbWFpbmluZywg
dGhvdWdoOgo+Cj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvTWFrZWZp
bGUgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9NYWtlZmlsZQo+ID4gaW5kZXggZjA0MzFlNmNi
NjdlLi45MDM5ZjM3MDlhZmYgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0
cy9NYWtlZmlsZQo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvTWFrZWZpbGUKPiA+
IEBAIC0xNzAsMTEgKzE3MCwxMSBAQCBpZm5lcSAoJChLQlVJTERfT1VUUFVUKSwpCj4gPiAgICAg
IyAkKHJlYWxwYXRoIC4uLikgcmVzb2x2ZXMgc3ltbGlua3MKPiA+ICAgICBhYnNfb2JqdHJlZSA6
PSAkKHJlYWxwYXRoICQoYWJzX29ianRyZWUpKQo+ID4gICAgIEJVSUxEIDo9ICQoYWJzX29ianRy
ZWUpL2tzZWxmdGVzdAo+ID4gLSAgS0hEUl9JTkNMVURFUyA6PSAtRF9HTlVfU09VUkNFIC1pc3lz
dGVtICR7YWJzX29ianRyZWV9L3Vzci9pbmNsdWRlCj4gPiArICBLSERSX0lOQ0xVREVTIDo9IC1p
c3lzdGVtICR7YWJzX29ianRyZWV9L3Vzci9pbmNsdWRlCj4gPiAgIGVsc2UKPiA+ICAgICBCVUlM
RCA6PSAkKENVUkRJUikKPiA+ICAgICBhYnNfc3JjdHJlZSA6PSAkKHNoZWxsIGNkICQodG9wX3Ny
Y2RpcikgJiYgcHdkKQo+ID4gLSAgS0hEUl9JTkNMVURFUyA6PSAtRF9HTlVfU09VUkNFIC1pc3lz
dGVtICR7YWJzX3NyY3RyZWV9L3Vzci9pbmNsdWRlCj4gPiArICBLSERSX0lOQ0xVREVTIDo9IC1p
c3lzdGVtICR7YWJzX3NyY3RyZWV9L3Vzci9pbmNsdWRlCj4KPiBBcyBtZW50aW9uZWQgaW4gWzFd
IChidXQgdGhlcmUgYXJlIGEgbG90IG9mIHBhdGNoZXMgdG8gbWFuYWdlIGhlcmUsIGFuZAo+IEkg
dGhpbmsgaXQgZ290IG92ZXJsb29rZWQpLCB5b3UgY291bGQgZmFjdG9yIG91dCB0aGUgZHVwbGlj
YXRlZAo+IC1EX0dOVV9TT1VSQ0UgaXRlbXMgaW50byBhIHNpbmdsZSBwbGFjZToKCkhpIEpvaG4s
CkhlcmUgSSdtIHJldmVydGluZyB0aGUgY2hhbmdlIEkgbWFkZSB0byB0aGUgTWFrZWZpbGUgaW4g
cGF0Y2ggMS82OCwKc2luY2UgLURfR05VX1NPVVJDRSBpcyBiZWluZyBhZGRlZCBkaXJlY3RseSB0
byBDRkxBR1Mgbm93LCBJIGRpZG4ndAp0aGluayBpdCB3YXMgbmVjZXNzYXJ5IHRvIGFkZCBpdCB0
byBLSERSX0lOQ0xVREVTIGFueW1vcmUuICBJIHdvdWxkCmhhdmUgbWVyZ2VkIHRoZSB0d28gcGF0
Y2hlcyB0b2dldGhlciwgYnV0IHNpbmNlIHRoZSBmaXJzdCBhbmQgc2Vjb25kCnBhdGNoZXMgZnJv
bSB2MiB3ZXJlIGFscmVhZHkgbWVyZ2VkLCBJIHRob3VnaHQgSSBzaG91bGQgbGVhdmUgdGhlbSBp
bgp0aGUgc2VyaWVzLgoKVGhhbmtzLApFZHdhcmQKCj4KPiBbMV0KPiBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9hbGwvYWM4YzIxN2UtNDEwOS00Y2E3LWE3ZGQtZmM0ZmM4YjBhNGRlQG52aWRpYS5j
b20vCj4KPiB0aGFua3MsCj4gLS0KPiBKb2huIEh1YmJhcmQKPiBOVklESUEKPgo+ID4gICAgIERF
RkFVTFRfSU5TVEFMTF9IRFJfUEFUSCA6PSAxCj4gPiAgIGVuZGlmCj4gPgo+ID4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2xpYi5tayBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2xpYi5tawo+ID4gaW5kZXggMzAyM2UwZTJmNThmLi5lNzgyZjRjOTZhZWUgMTAwNjQ0Cj4g
PiAtLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9saWIubWsKPiA+ICsrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2xpYi5tawo+ID4gQEAgLTY3LDcgKzY3LDcgQEAgTUFLRUZMQUdTICs9
IC0tbm8tcHJpbnQtZGlyZWN0b3J5Cj4gPiAgIGVuZGlmCj4gPgo+ID4gICBpZmVxICgkKEtIRFJf
SU5DTFVERVMpLCkKPiA+IC1LSERSX0lOQ0xVREVTIDo9IC1EX0dOVV9TT1VSQ0UgLWlzeXN0ZW0g
JCh0b3Bfc3JjZGlyKS91c3IvaW5jbHVkZQo+ID4gK0tIRFJfSU5DTFVERVMgOj0gLWlzeXN0ZW0g
JCh0b3Bfc3JjZGlyKS91c3IvaW5jbHVkZQo+ID4gICBlbmRpZgo+ID4KPiA+ICAgIyBJbiBvcmRl
ciB0byB1c2UgbmV3ZXIgaXRlbXMgdGhhdCBoYXZlbid0IHlldCBiZWVuIGFkZGVkIHRvIHRoZSB1
c2VyJ3Mgc3lzdGVtCj4gPiBAQCAtMTg4LDYgKzE4OCw5IEBAIGVuZGVmCj4gPiAgIGNsZWFuOiAk
KGlmICQoVEVTVF9HRU5fTU9EU19ESVIpLGNsZWFuX21vZHNfZGlyKQo+ID4gICAgICAgJChDTEVB
TikKPiA+Cj4gPiArIyBCdWlsZCB3aXRoIF9HTlVfU09VUkNFIGJ5IGRlZmF1bHQKPiA+ICtDRkxB
R1MgKz0gLURfR05VX1NPVVJDRQo+ID4gKwo+ID4gICAjIEVuYWJsZXMgdG8gZXh0ZW5kIENGTEFH
UyBhbmQgTERGTEFHUyBmcm9tIGNvbW1hbmQgbGluZSwgZS5nLgo+ID4gICAjIG1ha2UgVVNFUkNG
TEFHUz0tV2Vycm9yIFVTRVJMREZMQUdTPS1zdGF0aWMKPiA+ICAgQ0ZMQUdTICs9ICQoVVNFUkNG
TEFHUykKPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
