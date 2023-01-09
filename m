Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24175C61DB3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 19:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q0o7faXt68uv6WHFCaK8ViMBWXXwdTo5VGToPavQUcc=; b=N/gqR7RXFkcXtt
	VdrpSDp2LxUO7bwZ5z3v7ao1032XaBwjDLtBEdEHqUQe1E/6b8ZcnIm8NZWdddRiDgdpSGl0ciDWo
	yivQZIiNAS/ZCfGKz88br03rzBxPMxVKGBBlbqJK6ooE1DZtnBDXw0NcKPTt3EyTgcSwBu/LA6/Fz
	Fs0qebELywq3RdlY41gE4KFwsUXl0qIIFWyz6xF3JDtYdkx2YTgB72J7CDUwsyidUVhVxIdKYLW6I
	7n9k4qEg0vd3lCVNZf3yT7E8PtptT34pvhzeu90waRF9vkJw3u+PEasLoy66FIYCN1AXkcS31/6f7
	Q9ZjM7wMVrv6uJeu5kbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExdV-003ZOt-Sc; Mon, 09 Jan 2023 19:16:45 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pExdR-003ZMk-Cj
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 19:16:43 +0000
Received: by mail-pf1-x42a.google.com with SMTP id 200so767711pfx.7
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jan 2023 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=36j6vxRdrN87qT9QG9gc8q89/F94zjQ4zX9eyo6qDi0=;
        b=Q6VyJuZP6ZWcuQ3OTp5DozEx8Ne3i6oXmBm61F1yhW8fr2legrtQFdbDqwV4xtMv60
         BQzX6iX2wD67GnFoPDozCtQxmzwMANI9lRFVv7AkUTeUPZc5do5pfm1IbWshw2vvxlRm
         FP776wJLGZblFpEhED3D2QtJK3H/nn1ZImJXsDmge1bJwZCtaBY3O+6zKVnuBx1LYxW9
         OCDDLCe14cWHcTuI7INqO9rHjf8XwaYAE10aoiO5bzk38uHWPqCECzASWaF+ZIciXxiB
         be4nsT737dm4LcnX5TxKZxS0AUplHZWpgCHAmZTlBrHsXYGidRA5Yz+0fcrshJjIJh0q
         Y/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=36j6vxRdrN87qT9QG9gc8q89/F94zjQ4zX9eyo6qDi0=;
        b=AXIwG1o78ntDH+MqNQj+jpsQkgyW9JS617HkSzNGtcq2ZJPn246ggLCCtZO2Z9Dy3i
         iWLpxHFlDhiaG42qr9ggL5RkjR/0Zi5QtZEwz3mtErfjrCpvIo+OEPlMbQa7Bs9YrI7Y
         73fvQTayIoY2CO16k0vzqDNlwf3VNXa+d1g11pqPkv0iDDPANGo9wiHyyyX5IYy+CNXV
         HmihGB6RfzLd7OodwGIl7BD/ZcGFRs2zzYOIkEVeYgIbC9icEO/VuE6tWSHnTzA65xfJ
         ZKVBjzvfaKkyv7AkDD4U8aknXhGYwvWL+aKsHNj7w8JjJ7BY3xldWpDlBgQfbGwb+sO+
         zCJw==
X-Gm-Message-State: AFqh2kppSmph+ppshK0pNoc8bw8Q4h/RcsW+lzsosK8PuKMYC9pX+g72
	l4CL/gxfpUJ2dvOhYbmkt+bPB4cv8e2rY9VW
X-Google-Smtp-Source: AMrXdXv0O5WaluwoFm8aPDb6dSP9+OFCBzpMT5xJOVFG0YkRDZ61Rd0iQFmmj6amw0kPPWPHKGzXsA==
X-Received: by 2002:a05:6a00:4148:b0:582:a8f2:675 with SMTP id bv8-20020a056a00414800b00582a8f20675mr24864865pfb.20.1673291797385;
        Mon, 09 Jan 2023 11:16:37 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id p6-20020aa79e86000000b0056b4c5dde61sm6611960pfq.98.2023.01.09.11.16.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 11:16:36 -0800 (PST)
Message-ID: <3a838afe-974b-60bb-a0e5-83e366ec652e@rivosinc.com>
Date: Mon, 9 Jan 2023 11:16:34 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Adding V-ext regs to signal context w/o expanding kernel struct
 sigcontext to avoid glibc ABI break
Content-Language: en-US
To: Kito Cheng <kito.cheng@sifive.com>
Cc: Philipp Tomsich <philipp.tomsich@vrull.eu>,
 Andy Chiu <andy.chiu@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Vincent Chen <vincent.chen@sifive.com>, Florian Weimer <fweimer@redhat.com>,
 Rich Felker <dalias@libc.org>, Andrew Waterman <andrew@sifive.com>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 =?UTF-8?Q?Christoph_M=c3=bcllner?= <christoph.muellner@vrull.eu>,
 davidlt@rivosinc.com, Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Szabolcs Nagy <szabolcs.nagy@arm.com>, Greentime Hu
 <greentime.hu@sifive.com>, Aaron Durbin <adurbin@rivosinc.com>,
 Andrew de los Reyes <adlr@rivosinc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 GNU C Library <libc-alpha@sourceware.org>
References: <1631497278-29829-1-git-send-email-vincent.chen@sifive.com>
 <d613968f-0fae-1994-3bee-fb10765167c3@rivosinc.com>
 <73c0124c-4794-6e40-460c-b26df407f322@rivosinc.com>
 <CABvJ_xgDsthnm_h6mYowK03VUKqYk=nZsSZ7R=0BTwFHGKEAMw@mail.gmail.com>
 <50c598a6-e3b3-3062-abe7-23a406067533@rivosinc.com>
 <7430f494-9b43-5e03-c1e9-6b83e2611a11@rivosinc.com>
 <b67238bf-4b5d-dd17-99ff-88b0270ce10a@linaro.org>
 <CABgGipVT9L5p623Q2rbjrm=tTwcnjSr178CRKTNs+WMbm7=+-Q@mail.gmail.com>
 <91ef3c45-165f-d2b3-7c77-322c01802c41@rivosinc.com>
 <CABgGipXqEkasz2HTC4y6otCP6pFMmyEdYabA+OkUruUOfwypHg@mail.gmail.com>
 <18465ca3-934f-5b3e-170c-1ff0edea3a89@rivosinc.com>
 <CABgGipW66rdMnC99-h9ccuR+E+7fnaMfmzt=1ehGZnvxO34PwQ@mail.gmail.com>
 <a559e7dc-83fa-fac1-5811-95d37c6e662a@rivosinc.com>
 <CAAeLtUCPLD8if+-xikbjD78G=N_bEyMLh3WcZzyJR4Zt2LWz7Q@mail.gmail.com>
 <1f8f1d21-4a19-54fe-8b29-bf9e2a8501d7@rivosinc.com>
 <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
From: Vineet Gupta <vineetg@rivosinc.com>
In-Reply-To: <CALLt3ThickhyW5gX6LNjHXza484Xb5Cg8t7OUYH6hoA3V3GpAg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_111641_667670_D6751523 
X-CRM114-Status: GOOD (  19.38  )
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

SGkgS2l0bywKCk9uIDEvOS8yMyAwNTozMywgS2l0byBDaGVuZyB3cm90ZToKPiBIaSBWaW5lZXQ6
Cj4KPj4+Pj4+IFRoZSBuZXcgS2NvbmZpZyBDT05GSUdfUklTQ1ZfVlNUQVRFX0lOSVRfQUxMIHNl
ZW1zIGxpa2UgYQo+Pj4+Pj4gaGFjayBib2x0ZWQgb24gdG9wLgo+Pj4+PiBJSVVDLCBtb3N0IG9w
aW5pb25zIHN1Z2dlc3RlZCB0aGF0IHdlIHNob3VsZCBrZWVwIHRoZSBkZWZhdWx0IFZlY3Rvcgo+
Pj4+PiBzdGF0ZSB0byBPTiBpbiB0aHJlYWQ6Cj4+Pj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIyMDkyMTIxNDQzOS4xNDkxNTEwLTE3LXN0aWxsc29uQHJpdm9zaW5jLmNvbS9ULyN1
Cj4+Pj4gQWN0dWFsbHkgY29tbXVuaXR5IGZlZWRiYWNrIGlzIHRoYXQgdGhleSAqZG9uJ3QgKiB3
YW50IHRoZSBkZWZhdWx0Cj4+Pj4gdmVjdG9yIHN0YXRlIHRvIGJlIG9uIGR1ZSB0byBwb3dlciBp
bXBsaWNhdGlvbnMsIGluY3JlYXNlZCBzdGFjayBhbmQKPj4+PiBtZW1vcnkgdXNhZ2UgZm9yIHZl
Y3RvciBjb250ZW50cyAoaW4gdGhhdCB0aHJlYWQgYW5kIGVsc2Ugd2hlcmUgYXMKPj4+PiB3ZWxs
KS4gU28gd2Ugc2hvdWxkIGtlZXAgaXQgZGlzYWJsZWQgYnkgZGVmYXVsdCwgYnV0IGluZGVlZCB3
ZSBjb3VsZAo+Pj4+IGhhdmUgdGhhdCBLY29uZmlnIG9wdGlvbiB0byBlbmFibGUgaXQuIEdyYW50
ZWQgZGlzdHJvIGtlcm5lbHMgd2lsbCBrZWVwCj4+Pj4gaXQgZGlzYWJsZWQgYnkgZGVmYXVsdCwg
dGhpcyBsZXRzIHZlbmRvcnMgZW5hYmxlIGl0IHNlbGVjdGl2ZWx5IHVudGlsCj4+Pj4gdGhlIGZ1
bGwgdXNlcnNwYWNlIGVuYWJsaW5nIGJpdHMgYXJlIGluIHBsYWNlLgo+Pj4gU2hvdWxkIHdlIHB1
bnQgdGhpcyB0byB0aGUgRUxGIChlLmcuLCB1c2luZyBhIFJJU0MtViBzcGVjaWZpYwo+Pj4gYXR0
cmlidXRlKSBhbmQgdGFrZSBhIHBlci1wcm9jZXNzIGRlY2lzaW9uIG9uIHdoZXRoZXIgdG8gc3Rh
cnQgaW4gT04KPj4+IG9yIE9GRj8KPj4+IEkgZG9uJ3QgZmVlbCBmdWxseSBjb21mb3J0YWJsZSB3
aXRoIGEgS0NPTkZJRyB0aGF0IGNvdWxkIGNoYW5nZSBhbmQKPj4+IGludmFsaWRhdGUgdGhlIGFz
c3VtcHRpb25zIGEgdXNlcnNwYWNlIHByb2Nlc3MgY291bGQgaGF2ZSBtYWRl4oCmCj4+IFRoZSBL
Y29uZmlnIGlzIGp1c3QgYSBzdG9wIGdhcCBmb3IgdmVuZG9ycyB0byBlbmFibGUgViBkZXZlbG9w
bWVudCB3aGlsZQo+PiB0aGUgZnVsbCB1c2Vyc3BhY2Ugc3R1ZmYgaXMgc29ydGVkIG91dC4KPj4K
Pj4gSW5kZWVkIFJJU0NWX0FUVFJJQlVURVMgc2VjdGlvbiBoYXMgLW1hcmNoIGluZm8sIGJ1dCB3
ZSBuZWVkIHRvIGRvIHNvbWUKPj4gZGV2ZWxvcG1lbnQgYXJvdW5kIGl0IHRvIHBhcnNlIGl0IGFu
ZCB1c2UgaXQuCj4gSSBkb24ndCB0aGluayBSSVNDVl9BVFRSSUJVVEVTIGlzIHRoZSByaWdodCBw
bGFjZSB0byBjaGVjayB0aGF0IC0KCldoYXQgYSB0aW1pbmcuIEkganVzdCBmaW5pc2hlZCB0ZXN0
aW5nIGluaXRpYWwga2VybmVsIHBhdGNoIHRvIHBhcnNlIHRoZSAKZWxmIHNlY3Rpb24gYW5kIG9u
IHRvIHRhZyBwYXJzaW5nIG5vdyA7LSkKaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xp
bnV4L2tlcm5lbC9naXQvdmd1cHRhL2xpbnV4LmdpdC9sb2cvP2g9dG9waWMtZWxmLWF0dHIgCjxo
dHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC92Z3VwdGEvbGlu
dXguZ2l0L2xvZy8/aD10b3BpYy1lbGYtYXR0cj4KCj4gZXZlbiBpZiB0aGUKPiBwcm9ncmFtIGNv
bXBpbGVzIHdpdGhvdXQgViwgaXQgc3RpbGwgY2FuIGVuYWJsZSBWIGFuZCB0aGVuIGdldCBwZXJm
b3JtYW5jZQo+IGJlbmVmaXQgYnkgaWZ1bmMgaW4gZ2xpYmMsIG9yIGV2ZW4gc29tZSAzcmQgcGFy
dHkgbGlicmFyaWVzIG1pZ2h0IGFsc28gYmUKPiBvcHRpbWl6ZWQgd2l0aCBWIGV4dC4KClJpZ2h0
IGtlcm5lbCBjYW4gb25seSBoYW5kbGUgZHluYW1pYyBleGVjdXRhYmxlIGFuZC9vciB0aGUgdGhl
IGxvYWRlciAKaXRzZWxmLiBJZiBWIGlzIHVzZWQgZGlzdHJvIHdpZGUgd2UgYXJlIGNvdmVyZWQu
CkFuZCBpdCBjYW4gdGhlbiBhbHNvIHBhc3MgdGhpcyBpbmZvIChWIGVuYWJsZWQgYXMgSFdDQVAq
LCBubyBuZWVkIGZvciAKZXZlcnl0aGluZykKCkJ1dCB5b3UgYXJlIG5vdCBzdWdnZXN0aW5nIHRo
YXQgdGhlcmUgaXMgYSBzY2VuYXJpbyB3aXRoIGV4ZWN1dGFibGUgCmJ1aWx0IHNvbWVob3cgd2l0
aCBWIGluc3RydWN0aW9ucyAoZXZlbiAuYnl0ZSBlbmNvZGVkKSBidXQgbm90IGhhdmUgdGhhdCAK
aW5mbyBlbmNvZGVkIGluIFJWX0FUVFJfVEFHX2FyY2ggc3RyaW5nLiBBbmQgSSdkIGFyZ3VlIHRo
YXQgaXQgaXMgdXNlciAKZXJyb3IsIHRoZXkgbmVlZCB0byBtYWtlIHN1cmUgdGhhdCAtbWFyY2gg
aGFkICd2JyBwYXNzZWQgdG8gY29tcGlsZXIgCmFuZC9vciBhc3NlbWJsZXIuCgo+IEFuZCBkb24n
dCBmb3JnZXQgb3RoZXIgc2hhcmVkIGxpYnJhcmllcyBpbiB0aGUgc3lzdGVtLAoKTm8gSSd2ZSBu
b3QgZm9yZ290dGVuIGFib3V0IHNoYXJlZCBsaWJzIChhbmQgdGhlcmUncyBhbHNvIGEgY2FzZSBv
ZiAKbm9uLVYgYnVpbHQgZXhlY3V0YWJsZSBkbG9wZW4gYSBWIGJ1aWx0IGRzbykgd2hpY2ggY2Fu
J3QgYmUgaGFuZGxlZCBieSAKYWJvdmUuCgo+IGFyZSB3ZSBnb2luZyB0byBjaGVjayBhbGwgZGVw
ZW5kZW50IGxpYnJhcmllcyBhdCBwcm9ncmFtIGxvYWQgdGltZT8KPiBpdCB3aWxsIHJlcXVpcmUg
cmVzb2x2aW5nIHRoZSBsaWJyYXJ5IGRlcGVuZGVuY3kgYXQga2VybmVsLgo+IE9yIHdlIGludGVu
ZCB0byBlbmFibGUgViBvbmx5IGlmIGV4ZWN1dGFibGUgY29tcGlsZXMgd2l0aCBWPwoKU28gd2Ug
bmVlZCBhIHNpbWlsYXIgcGFyc2luZyBpbiBnbGliYyBsb2FkZXIgd2hpY2ggY3JlYXRlcyBhIHVu
aW9uIG9mICJWIAplbmFibGVkIGluIGFueSBsaWIiIGFuZCB0aGVuIGludm9rZXMgdGhlIHByY3Rs
IHRvIGVuYWJsZSwgaWYgaXQgaXMgbm90IAphbHJlYWR5LgoKLVZpbmVldAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
