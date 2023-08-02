Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EF1EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 02:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hg+uAnYzU2OYAGw03VUaa703kiatOppRY3x9Icb3Em0=; b=HQvO7dTd2Eicrh
	d6V1IS8huMem6Jmf0ZgmGNRojXwspJJjxyiNFLqq2T5+REWouQYwOgXqG99KrnP6WrIRR6L2xQnkG
	7uNgFJLyRwFtyhY+wJgKyYjwujrV/O4P/ji5Lb/BlnqXgzwczLDOl0qjHTdV4sGT3vCj5P/57dtpE
	5ktKhzF6Asr71AxHFwlaBs6yQ04SEUNNOh1S3ZWP0/NKUFDFwmU/Eo4uzIZt22yqX9XQsbtLBG5dO
	0lp3r4jcauUaaZUAQKhcZuJnEQS6XqiBc87fTOIUWWj11WwldA3FsxCGzeHZ7JSDepYW6j52G2fbS
	kLiK+SKFRInuzkY4o1NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR1Bw-003kP2-22;
	Wed, 02 Aug 2023 02:02:24 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR1Bt-003kOH-2V;
	Wed, 02 Aug 2023 02:02:23 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2b9bd59d465so97404241fa.3;
        Tue, 01 Aug 2023 19:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690941739; x=1691546539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7BRNQZESjyk6IP99SQFSrutDbZmWlCuaWV8SfC7y5xc=;
        b=RescUJyA4czz2u48U2yw6OwDEJhPPMZ5LPu/vHcqMP2ujZH2KrD93KlDeAzenoKEQV
         2lTjLCYkYzvWRowhIE4IlB27gLUJ5UUVgAIvqpAHZd5ynlMs5CQQNG35qkhmHDebxT5P
         V8VUysW079YKkGkz9/ivxoDvOQ3i6EF+X85hYKxDmt+nd82A53KN/Zy0KRXZ6TbAzjLG
         d4q8oaVncLzZ2GGhw0fxstmxv0oLqDlSev+NubvETyLS5f1YFDLLwz2IlM+SxtqKxVJR
         7Cit8m8XPAVblxn5NVRaai4sCh67qSxbEAb4KrlypAJRTqAK3uE5obDASpc8aalSo3+G
         AjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690941739; x=1691546539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7BRNQZESjyk6IP99SQFSrutDbZmWlCuaWV8SfC7y5xc=;
        b=j8IE95pWEzLsFZvbIdk60EQmIYwxEY13eusFqnhOEX8ttdGtiWpt5Lwc1ETE+Xk53T
         3wNdvW3q4vuue6+a9LzcuxJDkYqW8cSxgl2sBD4VlZh1eXXcpOhv878JUmHEJxRFq7d/
         24K6HerRgOSS/2/eweVQNg8i+KQsA9/R80qJH1gMgOAVvMgy4msgXs3SEKiFfgViw4JR
         nohotiM5sc+bQJhsf0JHXo8O0jB/oZpKP5x8duT+gWO4aHPepFq+lyf8QsBkTgewgJlL
         kACdssBUB4KPa04eC3OOgs5pPIXZKz1m5xPcjnsrafJi35Y/T185qwFOvuwyiD50GN2X
         Wp0g==
X-Gm-Message-State: ABy/qLaupirW02/rn1NiTb5XI8rNeOS3IcoXlXaGFTdbyU6yQDpPvY7z
	+uTtQqkiEy5gVfnkEMXe7SR7cFoZR9NkfzNA8vM=
X-Google-Smtp-Source: APBJJlHWMN+tdmvCgw7W5gmCWTgI3jD9ANjOYsnpgN9t/xJYLucTLaKx+Y5GKFzrL3a8R5KltoFMpV8MP4RICRmEGes=
X-Received: by 2002:a2e:9942:0:b0:2b9:cb2a:11bf with SMTP id
 r2-20020a2e9942000000b002b9cb2a11bfmr3820055ljj.49.1690941739021; Tue, 01 Aug
 2023 19:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690364259.git.haibo1.xu@intel.com> <36b5837e9e94465dd2b7d7a17bb84dea082f2ffa.1690364259.git.haibo1.xu@intel.com>
 <20230728-42019a78766a59dc5abdd412@orel>
In-Reply-To: <20230728-42019a78766a59dc5abdd412@orel>
From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 2 Aug 2023 10:02:07 +0800
Message-ID: <CAJve8omPWM7JR+Bqtemw0XjP8Q-C5zNbAzWxB_HMFcWKoSFuog@mail.gmail.com>
Subject: Re: [PATCH 3/4] KVM: riscv: selftests: Add guest helper to get vcpu id
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Haibo Xu <haibo1.xu@intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Sean Christopherson <seanjc@google.com>, 
	Colton Lewis <coltonlewis@google.com>, Andrew Jones <andrew.jones@linux.dev>, 
	Vipin Sharma <vipinsh@google.com>, Marc Zyngier <maz@kernel.org>, 
	Vishal Annapurve <vannapurve@google.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kvm-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230801_190221_836923_17E49678 
X-CRM114-Status: GOOD (  21.51  )
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

T24gRnJpLCBKdWwgMjgsIDIwMjMgYXQgNTo0OeKAr1BNIEFuZHJldyBKb25lcyA8YWpvbmVzQHZl
bnRhbmFtaWNyby5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMDM6MjA6
MDdQTSArMDgwMCwgSGFpYm8gWHUgd3JvdGU6Cj4gPiBBZGQgZ3Vlc3RfZ2V0X3ZjcHVpZCgpIGhl
bHBlciB0byBzaW1wbGlmeSBhY2Nlc3NpbmcgdG8gcGVyLWNwdQo+ID4gcHJpdmF0ZSBkYXRhLiBU
aGUgc3NjcmF0Y2ggQ1NSIHdhcyB1c2VkIHRvIHN0b3JlIHRoZSB2Y3B1IGlkLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEhhaWJvIFh1IDxoYWlibzEueHVAaW50ZWwuY29tPgo+ID4gLS0tCj4gPiAg
dG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmggfCAy
ICsrCj4gPiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3Iu
YyAgICAgfCA4ICsrKysrKysrCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRl
L3Jpc2N2L3Byb2Nlc3Nvci5oIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUv
cmlzY3YvcHJvY2Vzc29yLmgKPiA+IGluZGV4IDllYTZlN2JlZGM2MS4uY2E1MzU3MGNlNmRlIDEw
MDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3Yv
cHJvY2Vzc29yLmgKPiA+ICsrKyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRl
L3Jpc2N2L3Byb2Nlc3Nvci5oCj4gPiBAQCAtMTY1LDQgKzE2NSw2IEBAIHN0cnVjdCBzYmlyZXQg
c2JpX2VjYWxsKGludCBleHQsIGludCBmaWQsIHVuc2lnbmVkIGxvbmcgYXJnMCwKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzMsIHVuc2lnbmVkIGxvbmcgYXJnNCwK
PiA+ICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIGFyZzUpOwo+ID4KPiA+ICt1
aW50MzJfdCBndWVzdF9nZXRfdmNwdWlkKHZvaWQpOwo+Cj4gSSdkIGFsc28gcHV0IHRoaXMgcHJv
dG90eXBlIHNvbWV3aGVyZSBjb21tb24uCj4KPiA+ICsKPiA+ICAjZW5kaWYgLyogU0VMRlRFU1Rf
S1ZNX1BST0NFU1NPUl9IICovCj4gPiBkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMKPiA+IGluZGV4IGYxYjBiZTU4YTVkYy4uYjhhZDNlNjlh
Njk3IDEwMDY0NAo+ID4gLS0tIGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9yaXNj
di9wcm9jZXNzb3IuYwo+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2xpYi9y
aXNjdi9wcm9jZXNzb3IuYwo+ID4gQEAgLTMxNiw2ICszMTYsOSBAQCBzdHJ1Y3Qga3ZtX3ZjcHUg
KnZtX2FyY2hfdmNwdV9hZGQoc3RydWN0IGt2bV92bSAqdm0sIHVpbnQzMl90IHZjcHVfaWQsCj4g
PiAgICAgICB2Y3B1X3NldF9yZWcodmNwdSwgUklTQ1ZfQ09SRV9SRUcocmVncy5zcCksIHN0YWNr
X3ZhZGRyICsgc3RhY2tfc2l6ZSk7Cj4gPiAgICAgICB2Y3B1X3NldF9yZWcodmNwdSwgUklTQ1Zf
Q09SRV9SRUcocmVncy5wYyksICh1bnNpZ25lZCBsb25nKWd1ZXN0X2NvZGUpOwo+ID4KPiA+ICsg
ICAgIC8qIFNldHVwIHNjcmF0Y2ggcmVnaXRlciBvZiBndWVzdCAqLwo+Cj4gdHlwbzogcmVnaXN0
ZXIKPgo+IFRoZSBjb21tZW50IGFib3ZlIGlzIHByZXR0eSB1c2VsZXNzIHNpbmNlIGl0IGp1c3Qg
c3RhdGVzIHdoYXQgdGhlIGNvZGUKPiBzdGF0ZXMsIGJ1dCB3aXRoIGV2ZW4gbGVzcyBpbmZvcm1h
dGlvbiwgc2luY2UgaXQgZG9lc24ndCBzdGF0ZSBob3cgdGhlCj4gc3NjcmF0Y2ggcmVnaXN0ZXIg
aXMgZ2V0dGluZyBzZXQgdXAuIEknZCBlaXRoZXIgZHJvcCBpdCBvciB3cml0ZSBpdAo+IGFzCj4K
PiAgLyogU2V0dXAgc3NjcmF0Y2ggZm9yIGd1ZXN0X2dldF92Y3B1aWQoKSAqLwo+Cj4gPiArICAg
ICB2Y3B1X3NldF9yZWcodmNwdSwgUklTQ1ZfQ1NSX1JFRyhzc2NyYXRjaCksIHZjcHVfaWQpOwo+
ID4gKwo+ID4gICAgICAgLyogU2V0dXAgZGVmYXVsdCBleGNlcHRpb24gdmVjdG9yIG9mIGd1ZXN0
ICovCj4gPiAgICAgICB2Y3B1X3NldF9yZWcodmNwdSwgUklTQ1ZfQ1NSX1JFRyhzdHZlYyksICh1
bnNpZ25lZCBsb25nKWd1ZXN0X3VuZXhwX3RyYXApOwo+ID4KPiA+IEBAIC00MjQsMyArNDI3LDgg
QEAgdm9pZCB2bV9pbnN0YWxsX2ludGVycnVwdF9oYW5kbGVyKHN0cnVjdCBrdm1fdm0gKnZtLCB2
b2lkICgqaGFuZGxlcikoc3RydWN0IGV4X3IKPiA+Cj4gPiAgICAgICBoYW5kbGVycy0+ZXhjZXB0
aW9uX2hhbmRsZXJzWzFdWzBdID0gaGFuZGxlcjsKPiA+ICB9Cj4gPiArCj4gPiArdWludDMyX3Qg
Z3Vlc3RfZ2V0X3ZjcHVpZCh2b2lkKQo+ID4gK3sKPiA+ICsgICAgIHJldHVybiBjc3JfcmVhZChD
U1JfU1NDUkFUQ0gpOwo+ID4gK30KPiA+IC0tCj4gPiAyLjM0LjEKPiA+Cj4KClN1cmUhIHdpbGwg
Zml4IHRoZW0gaW4gdjIuCgpUaGFua3MsCkhhaWJvCgo+IFRoYW5rcywKPiBkcmV3CgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
