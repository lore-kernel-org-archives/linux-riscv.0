Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3976EE7B5E1
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=diH4PkHUeeZ9xyVwvA9MEt5M7cr4SF0ssz1XvosYJhg=; b=KtvAX+x2v0OXLu
	xkpXbG3j+m1IRa+NScjrUJgwiTUOE3I1W28/4b+nexb+FkgArfbZkRw+fRZ4SgKdO4i9rt/HuCEWx
	kGwL+UzsUbLAc9DaGGeJpUFI3hAr9/b19cmsxymnEjV3rlANH8/HMv9gnqEkSJlYf3+MnuhpSyPXw
	u+JGXGqEhUA3RvZUY0xjm1cVMFJmUIJI/g3DkBFVEH6bBTI9nlC+pTG6bJlRuhesLIS9NDZ41kfI2
	BTPJlPj6MpCj2UT8SnfO9+cM8XO3XSSthsUmt3QqYjkQKoYviV3xE8I2T90Ioxw56EAVdHdMp+N3/
	/w/QNooombpnyJQ8NHyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyjN-00HAp9-3C;
	Wed, 04 Oct 2023 10:03:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyjJ-00HAnr-1o
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 10:03:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3232e96deaaso428240f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 03:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1696413822; x=1697018622; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lfae490VV9WBXM89EM3q6lxJTFYipXmEfpcaCyueRfQ=;
        b=E/+lYvskmNxq3Ss/BMy/cEGhxAQ2QFcg3g2rL7QXR4pwMu5zP+GZ7Jke+R8cevax38
         gmZz8wDaEf/AYm2YGZ8pq9MYFAe6JKsuOFrI0ifqMQJOrXpBgjB5CcQjA/vqG5IwbyB+
         rBClCnJoxHKZFVxjD3ETbN5BTIyFZaU8kRQts11x8pX2v/gD6bmnM/3DnTNZPMpp2G0i
         tTdMW5nq6TJ6Slh7AcwMHkWYvI8I26yLw/Mcyg+D+Yx2avMrH5T1zCQsyPI2m0glUv6i
         EEfYf4bgF0DY0P2lVdQ3flTc9wakuv/wiI3F+Ybx0zHcI8IB6NLSlDFv3bvuvj2i1IAD
         TL0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696413822; x=1697018622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lfae490VV9WBXM89EM3q6lxJTFYipXmEfpcaCyueRfQ=;
        b=loFglq+WBsCarbImh/MmxULVzzCMNR21vZ2PTO8Xu0bK5qCr1xV78bSPw6jnPeM6ES
         O9+fUwKBBPkJXqvfTxSXnMAiELhG7KWJXpBK0Z11k1cjoSD3jIoY/UIzB/wm/rwcZazt
         r+ZG6PG1Op1x6XApK1jYSIpoKzCWxAwJecueoSir4c7v9Vnz/0+kheF+eowI3iEKAhP2
         I4J8UBLoMNWHlu0W2rp7J17tbArm2ZXyj2M+zsR7ps+eqvnT9zP0pTF48kd1M1Qxuo90
         DlGXeyu24EJ92TJaRRNtjzYkdGlKRfFYgAk5Il0LLIjw1RxAzx5E+tlzvNGnIwH9NRXm
         f3Wg==
X-Gm-Message-State: AOJu0YxSjVmKh+pURPM6KUoJihbldAZoQYPujm2tyj5LIPBUP+MTLsHh
	9AO4xK95225oX5JGJdZpKpE2Og==
X-Google-Smtp-Source: AGHT+IGqYRm62vztNg+Qsa035B5QN3qFSsyAitb9Yn2nk79RwGKOK04nLKq/XiAgCTq21LBJd/p9Vg==
X-Received: by 2002:adf:f40c:0:b0:31f:84c9:d75f with SMTP id g12-20020adff40c000000b0031f84c9d75fmr1467048wro.4.1696413821712;
        Wed, 04 Oct 2023 03:03:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:999:a3a0:9474:8d75:5115:42cb? ([2a01:e0a:999:a3a0:9474:8d75:5115:42cb])
        by smtp.gmail.com with ESMTPSA id k14-20020adff5ce000000b00323287186aasm3646419wrp.32.2023.10.04.03.03.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Oct 2023 03:03:41 -0700 (PDT)
Message-ID: <6ac16274-3816-4b46-9068-e97af66c815a@rivosinc.com>
Date: Wed, 4 Oct 2023 12:03:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
To: David Laight <David.Laight@ACULAB.COM>, Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>,
 Evan Green <evan@rivosinc.com>, =?UTF-8?Q?Bj=C3=B6rn_Topel?=
 <bjorn@rivosinc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ron Minnich <rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <20230930-patchy-curdle-ef5ee6e1a17c@spud>
 <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com>
 <eb9dcaaf313642b096d68df4b92e7466@AcuMS.aculab.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <eb9dcaaf313642b096d68df4b92e7466@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_030345_623070_916885A4 
X-CRM114-Status: GOOD (  17.90  )
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

CgpPbiAwNC8xMC8yMDIzIDEwOjI2LCBEYXZpZCBMYWlnaHQgd3JvdGU6Cj4gRnJvbTogQ2zDqW1l
bnQgTMOpZ2VyCj4+IFNlbnQ6IDAyIE9jdG9iZXIgMjAyMyAwODo0MAo+Pgo+PiBPbiAzMC8wOS8y
MDIzIDExOjIzLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+PiBPbiBUdWUsIFNlcCAyNiwgMjAyMyBh
dCAwNTowMzowOVBNICswMjAwLCBDbMOpbWVudCBMw6lnZXIgd3JvdGU6Cj4+Pj4gU2luY2UgY29t
bWl0IDYxY2FkYjkgKCJQcm92aWRlIG5ldyBkZXNjcmlwdGlvbiBvZiBtaXNhbGlnbmVkIGxvYWQv
c3RvcmUKPj4+PiBiZWhhdmlvciBjb21wYXRpYmxlIHdpdGggcHJpdmlsZWdlZCBhcmNoaXRlY3R1
cmUuIikgaW4gdGhlIFJJU0MtViBJU0EKPj4+PiBtYW51YWwsIGl0IGlzIHN0YXRlZCB0aGF0IG1p
c2FsaWduZWQgbG9hZC9zdG9yZSBtaWdodCBub3QgYmUgc3VwcG9ydGVkLgo+Pj4+IEhvd2V2ZXIs
IHRoZSBSSVNDLVYga2VybmVsIHVBQkkgZGVzY3JpYmVzIHRoYXQgbWlzYWxpZ25lZCBhY2Nlc3Nl
cyBhcmUKPj4+PiBzdXBwb3J0ZWQuCj4gLi4uCj4gCj4gVGhhdCBpdCBqdXN0IHJlYWxseSBob3Jy
aWQuCj4gSWYgdGhlIGNwdSBpcyBnb2luZyB0byB0cmFwIG1pc2FsaWduZWQgYWNjZXNzZXMgdGhl
biB5b3Ugd2FudAo+IFRoZSBjb21waWxlciBnZW5lcmF0ZWQgY29kZSAoaWUgcGFja2VkIGRhdGEp
IG5vdCB0byBnZW5lcmF0ZQo+IG1pc2FsaWduZWQgYWNjZXNzZXMuCgpIaSBEYXZpZCwKClNheWlu
ZyB0aGF0IHlvdSBzdXBwb3J0IG1pc2FsaWduZWQgYWNjZXNzIGRvZXMgbm90IG1lYW4gdGhhdCB0
aGV5IGFyZQpnb2luZyB0byBiZSBlZmZpY2llbnQsIGp1c3QgdGhhdCB0aGV5IGFyZSBzdXBwb3J0
ZWQgKGluIGZhY3QsIHRoZSB1QUJJCnN0YXRlIHRoYXQgdGhleSBtYXkgcGVyZm9ybSBwb29ybHkp
LiBUaGUgY29tcGlsZXIgaXMgYWN0dWFsbHkgbm90IHNvCnN0dXBpZCBhbmQgd2lsbCB0cnkgdG8g
ZG8gYXMgbXVjaCBhbGlnbmVkIGFjY2VzcyBhcyBwb3NzaWJsZSBpbiB3aGF0IGl0CmdlbmVyYXRl
cyAodW5sZXNzIGZvcmNlZCBieSBzb21lIGFzc2VtYmx5LCBjYXN0IG9yIHdoYXRldmVyIHRoYXQg
Y2FuCnNjcmV3IHVwIGFsaWdubWVudCBhY2Nlc3NlcykuIFRoaXMgaXMgYWxyZWFkeSB0aGUgY2Fz
ZSBhbmQgaXQgd2lsbCBtb3N0CnByb2JhYmx5IG5vdCBjaGFuZ2UuCgo+IFNvIHlvdSBoYXZlIHRv
IGNoYW5nZSB0aGUga2VybmVsIHVBQkkuCgpJIGRvbid0IHRoaW5rIHNvLiBSdWxlIE7CsDEgZm9y
IGtlcm5lbCBkZXZlbG9wbWVudCBpcyAiRG9uJ3QgYnJlYWsgdGhlCnVzZXJzcGFjZSIuIFNvIGlm
IGNoYW5naW5nIHRoZSBSSVNDLVYgdUFCSSB0byBzYXkgIm1pc2FsaWduZWQgYWNjZXNzZXMKYXJl
IG5vdCBzdXBwb3J0ZWQiLCB0aGF0IGlzIHVubGlrZWx5IHRvIGhhcHBlbi4gV2Ugc3RhdGVkIHRo
YXQKbWlzYWxpZ25lZCBhY2Nlc3MgYXJlIHN1cHBvcnRlZCBhbmQgdGh1cywgdGhleSB3aWxsIGNv
bnRpbnVlIHRvIGJlCnN1cHBvcnRlZC4KCj4gCj4gT1RPSCBpZiB5b3Uga25vd24gdGhhdCBzdWNo
IGFjY2Vzc2VzIHdvbid0IGZhdWx0IGFuZCB3aWxsIGJlCj4gbm90IHJlYWxseSBzbG93ZXIgdGhh
biBhbGlnbmVkIGFjY2Vzc2VzIHRoZW4gb3B0aW1pc2VkIHZlcnNpb25zCj4gb2Ygc29tZSBmdW5j
dGlvbnMgKGxpa2UgbWVtY3B5IGFuZCBjaGVja3N1bXMpIGNhbiB1c2UgbWlzYWxpZ25lZAo+IGFj
Y2Vzc2VzLgoKWWVzLCB0aGlzIGlzIHNlbGVjdGVkIGJ5IEhBVkVfRUZGSUNJRU5UX1VOQUxJR05F
RF9BQ0NFU1MuIE9uIFJJU0MtViwKc2luY2UgdGhlIHNwZWNpZmljYXRpb24gc2F5cyBub3RoaW5n
IGFib3V0IHRoZSBlZmZpY2llbmN5IG9mIHN1Y2gKYWNjZXNzLCB3ZSBjYW4ndCBzZWxlY3QgaXQg
bGlrZSB0aGF0LiBTb21lIFJJU0MtViBiYXNlZCBTb0MvQ1BVcyBtaWdodAp3YW50IHRvIHNlbGVj
dCBpdCBtYW51YWxseSBpbiB0aGVpciBjb25maWcuIEluIG9yZGVyIHRvIHN1cHBvcnQgdGhhdApk
eW5hbWljYWxseSBhbmQgaW4gYSBnZW5lcmljIHdheSwgc29tZSBmdXR1cmUgd29yayBjb3VsZCBp
bnZvbHZlIHVzaW5nCnN0YXRpYyBrZXlzIGZvciBzdWNoIGFsdGVybmF0aXZlcyBhbmQgZW5hYmxl
IGl0IGJhc2VkIG9uIHRoZSBzcGVlZCB0aGF0CndhcyBkZXRlY3RlZC4KClRoYW5rcywKCkNsw6lt
ZW50Cgo+IAo+IAlEYXZpZAo+IAo+IC0KPiBSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJy
YW1sZXkgUm9hZCwgTW91bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsKPiBSZWdp
c3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
