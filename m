Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 878ECC77B61
	for <linux-riscv@archiver.kernel.org>; Mon,  1 May 2023 17:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JyBrgE/laomTQTFtvhVvn5mCqGA3A4oLzKidc81l8OM=; b=nAWDeHE2OIFf8r
	VO4XMr37CLdokznFuMakB8eQzGpPz4KqDoKdyS4R2QwF/h6PxW7qkWHa6IDbgNqNAVWo1Q7ZTFL2i
	NGG+2JscYQGLznIvKXPuTWHpmXDzPXsb4n3BlIN/2MSxyX2TYoEwwiuWu+Dj2+ycjGokDO3qPq7RD
	Rlwe4GkxpQKN122KsAUceb9LdAqm8OIvIDAowO9d7uB6r4tSGd+A+KZwHf3Mr6h/2zqtN5F0sStYF
	C5AKPO6oXrLh52hyC3KwNy4ior6I+pSzNgy/gsHJB7J7UWHyjuj+JjAHjivl117xjPZa5AZpu81dh
	NUf4A9u/mPQkOGWxtKxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXAo-00GOoK-0N;
	Mon, 01 May 2023 17:18:50 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptXAl-00GOnR-1M
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 17:18:48 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-b9246a5f3feso4778511276.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 10:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682961525; x=1685553525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDAy0yw2Hl6Xad3kepfPR0FriSjDMaQH5Y0jnLgi2V4=;
        b=oDAyKLSdxWeDf2Rr539YuGPN8WIpEGf8MZUyaYq5jr+2u5r+cTYAw2jASoneiiCznU
         2SvyyFMMDnvtDUHjWd0FR1VXwxNkJF1Db2fr3bNgMpEqVPMJ7oTUtw4hQgx3+k8EZndj
         FscTv8obyqztv1iAv4Pz/neD2LiCUt46YSdAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682961525; x=1685553525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDAy0yw2Hl6Xad3kepfPR0FriSjDMaQH5Y0jnLgi2V4=;
        b=Jm2sKMLxmWT5Bgw2I0N+ems07JZ3N/S9S8LjMxBc00MkyFjqbh2BKU7NdgihkQb9s+
         x2sYvKPY5GB7dHrL587bwoWOjDkn/ZtJoTWEwHdwX4jIJIBInTTdLfpTJA9Kdi1LgMXx
         YDHEbdeKN6aBSMvAtEJNnFxsAJNAsI6LtuEIWBPyyVJ7DBesXMDf/YfRvJU5rEkwwULb
         k4rxoC3TN64ILQ6O2eV/b+hxM2sZfPCDlEBE6+VSawu0xecBoK+kr6KLcWDe3EmQ2nKO
         L79L/8eZdSpj+UwUXc1BW2wDkHm3bXihgT6z9ewNqcDqTQk4AFhr65Rcy2/vpJzOfWlW
         1eFg==
X-Gm-Message-State: AC+VfDzNtmWFgkbJsCUtKoTR/9oSJIlwN2FB9diNWFHV38n4OuSvgxZP
	Syu9MMPORZRWDQzVKvSMzvIxojSINjGtLvnyFU4Mhg==
X-Google-Smtp-Source: ACHHUZ4xbPdYRgrkeM2VPBoAnrgYWWyeLZD4OA+/jonGEEldTmOM3OQJ7u5/jGvTTtEi+xpcOHns6Q==
X-Received: by 2002:a81:66d5:0:b0:55a:3560:8ee0 with SMTP id a204-20020a8166d5000000b0055a35608ee0mr5011201ywc.20.1682961525309;
        Mon, 01 May 2023 10:18:45 -0700 (PDT)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id z126-20020a0df084000000b0055a07c7be39sm1299513ywe.31.2023.05.01.10.18.44
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 10:18:45 -0700 (PDT)
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-b9246a5f3feso4778473276.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 10:18:44 -0700 (PDT)
X-Received: by 2002:a17:902:f70f:b0:1a8:1c9a:f68 with SMTP id
 h15-20020a170902f70f00b001a81c9a0f68mr17818554plo.36.1682961504069; Mon, 01
 May 2023 10:18:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230321-kexec_clang16-v6-0-a2255e81ab45@chromium.org>
 <20230321-kexec_clang16-v6-4-a2255e81ab45@chromium.org> <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
In-Reply-To: <CAKwvOd=9RMivtkKX27nDDsagH5yCWjpAOvpE2uaW38KYC57vtg@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 1 May 2023 19:18:12 +0200
X-Gmail-Original-Message-ID: <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com>
Message-ID: <CANiDSCtDfPffUQTuH3JiPWC+87FBtpog7kT954PSoiTbB_fmJQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] risc/purgatory: Add linker script
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Eric Biederman <ebiederm@xmission.com>, Philipp Rudo <prudo@linux.vnet.ibm.com>, 
	Dave Young <dyoung@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Nathan Chancellor <nathan@kernel.org>, Tom Rix <trix@redhat.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Baoquan He <bhe@redhat.com>, 
	Philipp Rudo <prudo@redhat.com>, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Ross Zwisler <zwisler@google.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Simon Horman <horms@kernel.org>, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_101847_482524_124B9DA9 
X-CRM114-Status: GOOD (  24.34  )
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

SGkgTmljawoKVGhhbmtzIGZvciBjYXRjaGluZyB0aGlzLiBJdCBzaG91bGQgaGF2ZSBzYWlkCgpy
aXNjL3B1cmdhdG9yeTogUmVtb3ZlIHByb2ZpbGUgb3B0aW1pemF0aW9uIGZsYWdzCgpXaWxsIGZp
eCBpdCBvbiBteSBsb2NhbCBicmFuY2ggaW4gY2FzZSB0aGVyZSBpcyBhIG5leHQgdmVyc2lvbiBv
ZiB0aGUKc2VyaWVzLiBPdGhlcndpc2UsIHBsZWFzZSB0aGUgbWFpbnRhaW5lciBmaXggdGhlIHN1
YmplY3QuCgpUaGFua3MhCgpPbiBNb24sIDEgTWF5IDIwMjMgYXQgMTg6MTksIE5pY2sgRGVzYXVs
bmllcnMgPG5kZXNhdWxuaWVyc0Bnb29nbGUuY29tPiB3cm90ZToKPgo+IE9uIE1vbiwgTWF5IDEs
IDIwMjMgYXQgNTozOeKAr0FNIFJpY2FyZG8gUmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+
IHdyb3RlOgo+ID4KPiA+IElmIFBHTyBpcyBlbmFibGVkLCB0aGUgcHVyZ2F0b3J5IGVuZHMgdXAg
d2l0aCBtdWx0aXBsZSAudGV4dCBzZWN0aW9ucy4KPiA+IFRoaXMgaXMgbm90IHN1cHBvcnRlZCBi
eSBrZXhlYyBhbmQgY3Jhc2hlcyB0aGUgc3lzdGVtLgo+ID4KPiA+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnCj4gPiBGaXhlczogOTMwNDU3MDU3YWJlICgia2VybmVsL2tleGVjX2ZpbGUuYzog
c3BsaXQgdXAgX19rZXhlY19sb2FkX3B1cmFnb3J5IikKPiA+IFNpZ25lZC1vZmYtYnk6IFJpY2Fy
ZG8gUmliYWxkYSA8cmliYWxkYUBjaHJvbWl1bS5vcmc+Cj4KPiBIaSBSaWNhcmRvLAo+IFRoYW5r
cyBmb3IgdGhlIHNlcmllcy4gIERvZXMgdGhpcyBwYXRjaCA0LzQgbmVlZCBhIG5ldyBvbmxpbmUg
Y29tbWl0Cj4gZGVzY3JpcHRpb24/IEl0J3Mgbm90IGFkZGluZyBhIGxpbmtlciBzY3JpcHQgKG1h
eWJlIGFuIGVhcmxpZXIgdmVyc2lvbgo+IHdhcykuCj4KPiA+IC0tLQo+ID4gIGFyY2gvcmlzY3Yv
cHVyZ2F0b3J5L01ha2VmaWxlIHwgNSArKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZp
bGUgYi9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtlZmlsZQo+ID4gaW5kZXggNTczMDc5N2E2YjQw
Li5jZjNhNDQxMjFhOTAgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L3B1cmdhdG9yeS9NYWtl
ZmlsZQo+ID4gKysrIGIvYXJjaC9yaXNjdi9wdXJnYXRvcnkvTWFrZWZpbGUKPiA+IEBAIC0zNSw2
ICszNSwxMSBAQCBDRkxBR1Nfc2hhMjU2Lm8gOj0gLURfX0RJU0FCTEVfRVhQT1JUUwo+ID4gIENG
TEFHU19zdHJpbmcubyA6PSAtRF9fRElTQUJMRV9FWFBPUlRTCj4gPiAgQ0ZMQUdTX2N0eXBlLm8g
Oj0gLURfX0RJU0FCTEVfRVhQT1JUUwo+ID4KPiA+ICsjIFdoZW4gcHJvZmlsZSBvcHRpbWl6YXRp
b24gaXMgZW5hYmxlZCwgbGx2bSBlbWl0cyB0d28gZGlmZmVyZW50IG92ZXJsYXBwaW5nCj4gPiAr
IyB0ZXh0IHNlY3Rpb25zLCB3aGljaCBpcyBub3Qgc3VwcG9ydGVkIGJ5IGtleGVjLiBSZW1vdmUg
cHJvZmlsZSBvcHRpbWl6YXRpb24KPiA+ICsjIGZsYWdzLgo+ID4gK0tCVUlMRF9DRkxBR1MgOj0g
JChmaWx0ZXItb3V0IC1mcHJvZmlsZS1zYW1wbGUtdXNlPSUgLWZwcm9maWxlLXVzZT0lLCQoS0JV
SUxEX0NGTEFHUykpCj4gPiArCj4gPiAgIyBXaGVuIGxpbmtpbmcgcHVyZ2F0b3J5LnJvIHdpdGgg
LXIgdW5yZXNvbHZlZCBzeW1ib2xzIGFyZSBub3QgY2hlY2tlZCwKPiA+ICAjIGFsc28gbGluayBh
IHB1cmdhdG9yeS5jaGsgYmluYXJ5IHdpdGhvdXQgLXIgdG8gY2hlY2sgZm9yIHVucmVzb2x2ZWQg
c3ltYm9scy4KPiA+ICBQVVJHQVRPUllfTERGTEFHUyA6PSAtZSBwdXJnYXRvcnlfc3RhcnQgLXog
bm9kZWZhdWx0bGliCj4gPgo+ID4gLS0KPiA+IDIuNDAuMS40OTUuZ2M4MTZlMDliNTNkLWdvb2cK
PiA+Cj4KPgo+IC0tCj4gVGhhbmtzLAo+IH5OaWNrIERlc2F1bG5pZXJzCgoKCi0tIApSaWNhcmRv
IFJpYmFsZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
