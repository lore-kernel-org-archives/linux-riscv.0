Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8867E784AC
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 11:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yC3Xhmf1MOnw7wL5UiJTwJQVRsFdn03qurqr/q247fI=; b=qvVI+shbpJzuj9
	0/pW9rIWWeJTLlwaNc+1J0Xc4porJadHhKWtS0Q8JVeEp5eF7xQ9dGchh471B4ur/Td+gUIntcwBO
	Y0Zz+D1ldtUUbcY7FjGOHZb1z1o+UTrUYG6I3g00/eFhqm/kJi5rcsESxKIJ3nQILs1SDRwA2JNfI
	OjH8yV2b0/Jv77Sn0FnJxgowpLSziHFSsfR1ILzdJ1A2ni5Ov3gqRC2I+7Xbi1cJZ+TgFPdcmYHxn
	dtG2Cx01CAkqtK0PxUtT6DPh1LpwnWLFt/b8lxA80pHgV77RGWSN8stogV9vpQZJsw7t+ieHQUQ/8
	W8DqPrmZYobXBnVSXJNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGxD-00CWoG-1v;
	Mon, 02 Oct 2023 11:19:11 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnGx8-00CWnO-2t
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 11:19:10 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3233799e7b8so1725151f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 02 Oct 2023 04:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696245541; x=1696850341; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IBk2yQCgJNwrSQBrXRJII+6gdKdvDeECA4pHuU8zrw=;
        b=KTow8xH82ibs3EJnqYo52IjpfUjN47MKeYtyMTIFE7mRbr2b0fgzoCFXOfULkHB0Ju
         RnN+TZ1FzAFMCe6EqTvb9eWa4yq1VI0c5BnShG2N7AXYtR/hguI5/iY7Wd1HLUJDrY2b
         ecZGxP0jaEC0owws4iYX8u66KUeuu3GRX77/dg3aIwKncl6n8tSTJR2gsLPrbjGvk4LH
         //SL7dQn8foEp1fLx5nOHfGju5CTEAqPTLJECMSZ3k890f5GYjnRqtW4nPN5ZsRGJpNo
         Ytnc07wD5NQdCFD6xDh2E4gz3QRhThdHaQUtcCdWRlP3N72b80Hb66Y8sJyN5epDKCF2
         7WLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696245541; x=1696850341;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+IBk2yQCgJNwrSQBrXRJII+6gdKdvDeECA4pHuU8zrw=;
        b=Bpyjnt9QxwDt3vN9gU90HuFJDReP7WF43qhGHUBlU1OVsMqm9xHKNB5Hmp9YpFKdqz
         uxHXJ7+82jbMP8ocSAi4c12KbAk4lyrode81bSsoGGNb5IUstXVaoTyUs8DTt28KK+S0
         Jz7Ftah7wtcsWA2G1ABgNwmky0geDk/OzANqRbKWqjryLlfc//vjlbw4vCekUtrQ8t2d
         oX/469QjiKeEg52s2jsopbxK3IL9Dvh6mwVVjTEHCQWs82LXpaJPp5xz3MQ2e7USagGT
         ohzLXgIwq5699qE+MGx3Ev+kLX6nmM4/34/lP+XdqfWZong2pMu2+Lf0IAgSx9pAXCzf
         gVtw==
X-Gm-Message-State: AOJu0Yy6N8GR7NMIsFxK/u1J7GvfzsEmFJZQocE9RIvmX0kI5GzbYLPn
	ivKJUpXKI0/66JxwnqaSu6Ww4A==
X-Google-Smtp-Source: AGHT+IGIH+t0eT2hy6BdihJbHdiZvxDZ0vJ8nw1AF1rd0+u1rWe03U4mwOM2KFr/MtA2vRH1iydH5g==
X-Received: by 2002:adf:e950:0:b0:317:7238:336a with SMTP id m16-20020adfe950000000b003177238336amr8806165wrn.5.1696245541298;
        Mon, 02 Oct 2023 04:19:01 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:2dc5:b516:f0fb:7491? ([2a01:e0a:999:a3a0:2dc5:b516:f0fb:7491])
        by smtp.gmail.com with ESMTPSA id e9-20020adfe7c9000000b003197efd1e7bsm13880009wrn.114.2023.10.02.04.19.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 04:19:00 -0700 (PDT)
Message-ID: <693e6584-1e66-48c0-aa7c-61d9f88abd4c@rivosinc.com>
Date: Mon, 2 Oct 2023 13:18:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>, =?UTF-8?Q?Bj=C3=B6rn_Topel?=
 <bjorn@rivosinc.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Ron Minnich <rminnich@gmail.com>,
 Daniel Maslowski <cyrevolt@googlemail.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <20230930-patchy-curdle-ef5ee6e1a17c@spud>
 <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com>
 <20231002-spearman-doze-70cc026ac13e@spud>
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20231002-spearman-doze-70cc026ac13e@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_041907_022505_67F4F889 
X-CRM114-Status: GOOD (  18.63  )
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

CgpPbiAwMi8xMC8yMDIzIDEyOjQ5LCBDb25vciBEb29sZXkgd3JvdGU6Cj4gT24gTW9uLCBPY3Qg
MDIsIDIwMjMgYXQgMDk6NDA6MDRBTSArMDIwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+Pgo+
Pgo+PiBPbiAzMC8wOS8yMDIzIDExOjIzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBUdWUs
IFNlcCAyNiwgMjAyMyBhdCAwNTowMzowOVBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6
Cj4+Pj4gU2luY2UgY29tbWl0IDYxY2FkYjkgKCJQcm92aWRlIG5ldyBkZXNjcmlwdGlvbiBvZiBt
aXNhbGlnbmVkIGxvYWQvc3RvcmUKPj4+PiBiZWhhdmlvciBjb21wYXRpYmxlIHdpdGggcHJpdmls
ZWdlZCBhcmNoaXRlY3R1cmUuIikgaW4gdGhlIFJJU0MtViBJU0EKPj4+PiBtYW51YWwsIGl0IGlz
IHN0YXRlZCB0aGF0IG1pc2FsaWduZWQgbG9hZC9zdG9yZSBtaWdodCBub3QgYmUgc3VwcG9ydGVk
Lgo+Pj4+IEhvd2V2ZXIsIHRoZSBSSVNDLVYga2VybmVsIHVBQkkgZGVzY3JpYmVzIHRoYXQgbWlz
YWxpZ25lZCBhY2Nlc3NlcyBhcmUKPj4+PiBzdXBwb3J0ZWQuIEluIG9yZGVyIHRvIHN1cHBvcnQg
dGhhdCwgdGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBTLW1vZGUKPj4+PiBoYW5kbGluZyBv
ZiBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFzIHdlbGwgc3VwcG9ydCBmb3IgcHJjdGwoUFJfVU5BTElH
TikuCj4+Pj4KPj4+PiBIYW5kbGluZyBtaXNhbGlnbmVkIGFjY2VzcyBpbiBrZXJuZWwgYWxsb3dz
IGZvciBhIGZpbmVyIGdyYWluIGNvbnRyb2wKPj4+PiBvZiB0aGUgbWlzYWxpZ25lZCBhY2Nlc3Nl
cyBiZWhhdmlvciwgYW5kIHRoYW5rcyB0byB0aGUgcHJjdGwgY2FsbCwgY2FuCj4+Pj4gYWxsb3cg
ZGlzYWJsaW5nIG1pc2FsaWduZWQgYWNjZXNzIGVtdWxhdGlvbiB0byBnZW5lcmF0ZSBTSUdCVVMu
IFVzZXIKPj4+PiBzcGFjZSBjYW4gdGhlbiBvcHRpbWl6ZSBpdHMgc29mdHdhcmUgYnkgcmVtb3Zp
bmcgc3VjaCBhY2Nlc3MgYmFzZWQgb24KPj4+PiBTSUdCVVMgZ2VuZXJhdGlvbi4KPj4+Pgo+Pj4+
IEN1cnJlbnRseSwgdGhpcyBzZXJpZXMgaXMgdXNlZnVsIGZvciBwZW9wbGUgdGhhdCB1c2VzIGEg
U0JJIHRoYXQgZG9lcwo+Pj4+IG5vdCBoYW5kbGVkIG1pc2FsaWduZWQgdHJhcHMuIEluIGEgbmVh
ciBmdXR1cmUsIHRoaXMgc2VyaWVzIHdpbGwgbWFrZQo+Pj4+IHVzZSBhIFNCSSBleHRlbnNpb24g
WzFdIGFsbG93aW5nIHRvIHJlcXVlc3QgZGVsZWdhdGlvbiBvZiB0aGUKPj4+PiBtaXNhbGlnbmVk
IGxvYWQvc3RvcmUgdHJhcHMgdG8gdGhlIFMtbW9kZSBzb2Z0d2FyZS4gVGhpcyBleHRlbnNpb24g
aGFzCj4+Pj4gYmVlbiBzdWJtaXR0ZWQgZm9yIHJldmlldyB0byB0aGUgcmlzY3YgdGVjaC1wcnMg
Z3JvdXAuIEFuIE9wZW5TQkkKPj4+PiBpbXBsZW1lbnRhdGlvbiBmb3IgdGhpcyBzcGVjIGlzIGF2
YWlsYWJsZSBhdCBbMl0uCj4+Pj4KPj4+PiBUaGlzIHNlcmllcyBjYW4gYmUgdGVzdGVkIHVzaW5n
IHRoZSBzcGlrZSBzaW11bGF0b3IgWzNdIGFuZCBhbiBvcGVuU0JJCj4+Pj4gdmVyc2lvbiBbNF0g
d2hpY2ggYWxsb3dzIHRvIGFsd2F5cyBkZWxlZ2F0ZSBtaXNhbGlnbmVkIGxvYWQvc3RvcmUgdG8K
Pj4+PiBTLW1vZGUuCj4+Pgo+Pj4gU29tZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGRvIG5vdCBi
dWlsZCBmb3IgYW55IGNvbmZpZ3MsIHNvbWUgYXJlCj4+PiBicm9rZW4gZm9yIGNsYW5nIGJ1aWxk
cyBhbmQgb3RoZXJzIGFyZSBicm9rZW4gZm9yIG5vbW11LiBQbGVhc2UgdHJ5IHRvPiBidWlsZCB0
ZXN0IHRoaXMgbW9yZSB0aG9yb3VnaGx5IGJlZm9yZSB5b3Ugc3VibWl0IHRoZSBuZXh0IHZlcnNp
b24uCj4+Cj4+IEhpIENvbm9yLAo+Pgo+PiBUaGFua3MgZm9yIHRoZSBmZWVkYmFjaywgSSdsbCBj
aGVjayB0aGF0Lgo+Pgo+Pj4KPj4+IEFsc28sIEFJVUksIHRoaXMgc2VyaWVzIHNob3VsZCBiZSBt
YXJrZWQgUkZDIHNpbmNlIHRoZSBTQkkgZXh0ZW5zaW9uCj4+PiB0aGlzIHJlbGllcyBvbiBoYXMg
bm90IGJlZW4gZnJvemVuLgo+Pgo+PiBUaGlzIHNlcmllcyBkb2VzIG5vdCBhY3R1YWxseSB1c2Vz
IHRoZSBTQkkgZXh0ZW5zaW9uIGJ1dCBwcm92aWRlcyBhIHdheQo+PiB0byBkZXRlY3QgaWYgbWlz
YWxpZ25lZCBhY2Nlc3NlcyBhcmUgbm90IGhhbmRsZWQgYnkgaGFyZHdhcmUgbm9yIGJ5IHRoZQo+
PiBTQkkuIEl0IGhhcyBiZWVuIHJlcG9ydGVkIGJ5IFJvbiAmIERhbmllbCB0aGV5IHRoZXkgaGF2
ZSBhIG1pbmltYWwgU0JJCj4+IGltcGxlbWVudGF0aW9uIHRoYXQgZG9lcyBub3QgaGFuZGxlIG1p
c2FsaWduZWQgYWNjZXNzZXMgYW5kIHRoYXQgdGhleQo+PiB3b3VsZCBsaWtlIHRvIG1ha2UgdXNl
IG9mIHRoZSBQUl9TRVRfVU5BTElHTiBmZWF0dXJlLiBUaGlzIGlzIHdoYXQgdGhpcwo+PiBzZXJp
ZXMgYWRkcmVzc2VzIChhbmQgdGh1cyBkb2VzIG5vdCBkZXBlbmQgb24gdGhlIG1lbnRpb25lZCBT
QkkgZXh0ZW5zaW9uKS4KPiAKPiBBaCwgSSBtdXN0IGhhdmUgbWlzcmVhZCB0aGVuLiBBcG9sb2dp
ZXMuCgpObyB3b3JyaWVzLCBtYXliZSBJIHNob3VsZCBhY3R1YWxseSByZW1vdmUgdGhpcyBmcm9t
IHRoZSBjb3ZlciBsZXR0ZXIgdG8KYXZvaWQgYW55IGNvbmZ1c2lvbiAhCgpDbMOpbWVudAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
