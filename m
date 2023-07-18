Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A12FDEB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 06:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43ICgQRgh3LGoArZP2K12MWPufSpK92/gt2JzFzxGlk=; b=dm8fW25LVG/btj
	/3p5YYyegbNAgkgNFnvhy8za8Z9+1yBEJDmxXS2zWPgYCLnKWslRes4pWQN5F5ejsLHAvD8y7XmS0
	c0r1gxtdelAEJZOOWgEjyoxPlV9zcTL/HpRcyF0cx+EEdUHd28sZNyv2HsSQP3kharOwLR4NqeT71
	VOz9xm0H5QjHG8MlzUYritC5Fg7PHMVDK7unFc+L3AXI6RVRsfBhBXuIrtNTCbIuIqoTcdFPEPbmt
	PhIcFdhabN9dNC8SPuDK3q7OCa0G0x+a6NVCCwzgfR50qypIaCld9BMtMemNgSxWWeMDq2TjtU4Ef
	3yc1hJsWqZKGzrOHTdpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Qp-005bNv-2u;
	Wed, 19 Jul 2023 06:13:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM0Qm-005bLo-0J
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 06:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0STktbJZqSEHEkaY8G88IbeDelRosoYHATFnhEe6mP8=; b=Ix4jqBsBTYjfGUj+H9pA8DWC3b
	chW2QmWq4DQ0n5XsfwOlhXpRR+WVVuKqRdtDmujlioSq1iZGIKwr8ntwmBERoZ0ps07TLKIvIRtOS
	d2GIRBkgeBmriypLCsN1I00EMVpej3dE3o3fG/mAjteXF+swIbfp8tX6lpCbaghDJVA/8eFLqL0Rm
	696OouW2w3DiAPXZA5VLszMn2rXuQ/uobTD6oksS/GNRvfXLKeVE+l4rPO9jpY0x8Co5zAylDUBcD
	12abZBuixcc835KtkuDyrNNYVRfbg3BtGCDqw1GyKAAFnqjsg8nQ+aTtAD7YEdBpJ3D7G90+bVxtG
	PJIjMkkw==;
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLrQd-00C0Gt-0L
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jul 2023 20:36:17 +0000
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1b9cd6a0051so38892855ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 13:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689712508; x=1692304508;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0STktbJZqSEHEkaY8G88IbeDelRosoYHATFnhEe6mP8=;
        b=GFh8Zru2njhLpDSnX8mJ+n4faZxicMCoWsuNNJyT47wAmvLVzq7AYOJ7sbsiRtjO6C
         VOvI0kB10kv7Gk7e3XSLd35I3JIlO+Qro03nvb7E3RL+wNRzxxWmmybYhYwnk2UPmGeN
         HV/DBayNyuIalE8i9RAp8zGKg9Of3GyQ1f6dBupC+4fOPf5+mUZiLEyK7QQJ8t1tRdiZ
         FyYZCxf8Jjobqj73And64pagXHvEVtjYFTOPMpNSQsUrV32Ob3Kd1uRCzCIDRsbf3DHC
         kcTacRpMlHqmTGbUvr54eCWSY1AKeqpz6zLWoV9lIapwC+waz1ArEFD2HMM3bWsaMNN7
         1s+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689712508; x=1692304508;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0STktbJZqSEHEkaY8G88IbeDelRosoYHATFnhEe6mP8=;
        b=Neb730LvWauuMwBguIUDNiXUoqnXM8igt2nwrXMPtK/R2zLnQSLJwoIwf516IgP+7Q
         nwapR4wDubwtMtHINXxRX+6C8ASi3aapLGFDjwcM6v61sgGHGMzkpsewKKKVIa5CmQK9
         yKEjcaEJWeX8mAus/2R0/1hUB/v7mVeq7YPuwJeZRgRUwm+g+fjrqD1TvuAT9DIx+0Mw
         A3MjPF1XNfILSsHP+mIsTclXHbGtkpFUmTnpostpZpS+sGDyV6TnOGQZnY4t8S0hkbOy
         b25IImBsmPxATK6b+09H5QGvYP5pmvuW7fshe5Cy0nrTeEMvyN1kc3bC2lkEGgREQURt
         iqAQ==
X-Gm-Message-State: ABy/qLb3B12kIEqmkfXEL9qg3PR+c+j0+k7IUPqsk7TC+/WtpKb3VYB4
	f3dXzrdrHXwAJ2qjoqkHDQM=
X-Google-Smtp-Source: APBJJlFCLB6EJgk5MjzeBQw2l9CKBn4lwYb3F3EXRBlDrSgUtyUYucKHZS8uwLNIVQiwTe5nDtsZVA==
X-Received: by 2002:a17:903:22c5:b0:1b9:e399:4c8d with SMTP id y5-20020a17090322c500b001b9e3994c8dmr87422plg.3.1689712508330;
        Tue, 18 Jul 2023 13:35:08 -0700 (PDT)
Received: from [127.0.0.1] ([212.107.28.53])
        by smtp.gmail.com with ESMTPSA id p12-20020a170902eacc00b001b89466a5f4sm2307991pld.105.2023.07.18.13.35.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jul 2023 13:35:07 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
Message-ID: <03206759-8d6a-a410-a8f9-d4678236bdbf@gmail.com>
Date: Wed, 19 Jul 2023 04:35:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: entry: set a0 prior to
 syscall_enter_from_user_mode
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Felix Yan <felixonmars@archlinux.org>,
 Ruizhe Pan <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
References: <20230718162940.226118-1-CoelacanthusHex@gmail.com>
 <87pm4p2et2.fsf@all.your.base.are.belong.to.us>
Content-Language: en-GB-large
In-Reply-To: <87pm4p2et2.fsf@all.your.base.are.belong.to.us>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_213615_377118_18B132A8 
X-CRM114-Status: GOOD (  16.46  )
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

Ck9uIDIwMjMvNy8xOSAwMzozNSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBDZWxlc3RlIExpdSA8
Y29lbGFjYW50aHVzaGV4QGdtYWlsLmNvbT4gd3JpdGVzOgo+IAo+PiBXaGVuIHdlIHRlc3Qgc2Vj
Y29tcCB3aXRoIDYuNCBrZXJuZWwsIHdlIGZvdW5kIGVycm5vIGhhcyB3cm9uZyB2YWx1ZS4KPj4g
SWYgd2UgZGVueSBORVRMSU5LX0FVRElUIHdpdGggRUFGTk9TVVBQT1JULCBhZnRlciBmMGJkZGY1
MDU4NmQsIHdlIHdpbGwKPj4gZ2V0IEVOT1NZUyBpbnN0ZWFkLiBXZSBnb3Qgc2FtZSByZXN1bHQg
d2l0aCA5YzI1OThkNDM1MTAgKCJyaXNjdjogZW50cnk6IFNhdmUgYTAKPj4gcHJpb3Igc3lzY2Fs
bF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIikuCj4+Cj4+IEFmdGVyIGFuYWx5c2luZyBjb2RlLCB3
ZSB0aGluayB0aGF0IHJlZ3MtPmEwID0gLUVOT1NZUyBzaG91bGQgYmUgYWR2YW5jZWQgYmVmb3Jl
Cj4+IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUgdG8gZml4IHRoaXMgcHJvYmxlbS4gSW4g
X19zZWNjb21wX2ZpbHRlciwgd2hlbgo+PiBzZWNjb21wIHJlamVjdGVkIHRoaXMgc3lzY2FsbCB3
aXRoIHNwZWNpZmllZCBlcnJubywgdGhleSB3aWxsIHNldCBhMCB0byByZXR1cm4KPj4gbnVtYmVy
IGFzIHN5c2NhbGwgQUJJLCBhbmQgdGhlbiByZXR1cm4gLTEuIFRoaXMgcmV0dXJuIG51bWJlciBp
cyBmaW5hbGx5IHBhc3MKPj4gYXMgcmV0dXJuIG51bWJlciBvZiBzeXNjYWxsX2VudGVyX2Zyb21f
dXNlcl9tb2RlLCBhbmQgdGhlbiBpcyBjb21wYXJlZAo+PiB3aXRoIE5SX3N5c2NhbGxzIGFmdGVy
IGNvbnZlcnRlZCB0byB1bG9uZyAoc28gaXQgd2lsbCBiZSBVTE9OR19NQVgpLgo+PiBUaGUgY29u
ZGl0aW9uIHN5c2NhbGwgPCBOUl9zeXNjYWxscyB3aWxsIGFsd2F5cyBiZSBmYWxzZSwgc28gcmVn
cy0+YTAgPSAtRU5PU1lTCj4+IGlzIGFsd2F5cyBleGVjdXRhYmxlLiBJdCBjb3ZlcmVkIGEwIHNl
dCBieSBzZWNjb21wLCBzbyB3ZSBhbHdheXMgZ2V0Cj4+IEVOT1NZUyB3aGVuIG1hdGNoIHNlY2Nv
bXAgUkVUX0VSUk5PIHJ1bGUuCj4gCj4gSXNuJ3Qgc29tZXRoaW5nIGxpa2UuLi4KPiAKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPiBpbmRleCBmOTEwZGZjY2JmNWQuLjE1YThiNDg5OGE2YyAxMDA2NDQKPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMu
Ywo+IEBAIC0yOTcsNyArMjk3LDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rp
b24gdm9pZCBkb190cmFwX2JyZWFrKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICBhc21saW5rYWdl
IF9fdmlzaWJsZSBfX3RyYXBfc2VjdGlvbiB2b2lkIGRvX3RyYXBfZWNhbGxfdShzdHJ1Y3QgcHRf
cmVncyAqcmVncykKPiAgewo+ICAJaWYgKHVzZXJfbW9kZShyZWdzKSkgewo+IC0JCXVsb25nIHN5
c2NhbGwgPSByZWdzLT5hNzsKPiArCQlsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPiAgCj4gIAkJ
cmVncy0+ZXBjICs9IDQ7Cj4gIAkJcmVncy0+b3JpZ19hMCA9IHJlZ3MtPmEwOwo+IEBAIC0zMDYs
NyArMzA2LDcgQEAgYXNtbGlua2FnZSBfX3Zpc2libGUgX190cmFwX3NlY3Rpb24gdm9pZCBkb190
cmFwX2VjYWxsX3Uoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIAo+ICAJCXN5c2NhbGwgPSBzeXNj
YWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwo+ICAKPiAtCQlpZiAoc3lz
Y2FsbCA8IE5SX3N5c2NhbGxzKQo+ICsJCWlmIChzeXNjYWxsID4gLTEgJiYgc3lzY2FsbCA8IE5S
X3N5c2NhbGxzKQo+ICAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Cj4gIAkJZWxz
ZQo+ICAJCQlyZWdzLT5hMCA9IC1FTk9TWVM7Cj4gCj4gCj4gLi4uZWFzaWVyIHRvIHJlYWQ/Cj4g
Cj4gCj4gQmrDtnJuCgpJdCBzZWVtcyB0aGF0IHlvdXIgY2hhbmdlIHR1cm4gaXQgYmFjayB0byB0
aGUgYmVnaW5uaW5nLiBJZiBzeXNjYWxsID09IC0xLAppdCBpcyBzdXBwb3NlZCB0byBnbyBuZWl0
aGVyIGZpcnN0IG5vciBlbHNlIGJyYW5jaC4gSXQgc2hvdWxkIGRvIE5PVEhJTkcuCkhvd2V2ZXIg
aXQgd2FzIHN0aWxsIGEgZ3JlYXQgaWRlYS4gSXQgbWF5IGJlIGJldHRlciB0byB1c2UgYSBzZXQg
b2YgaWYtc3RhdGVtZW50CnRvIGNsYXJpZnkgdGhlIGxvZ2ljLgoKZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYXBzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCmluZGV4IGY5
MTBkZmNjYmY1ZDIuLmQwYmQ3MjUyNDQ1OTQgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzLmMKKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYwpAQCAtMzA2LDcgKzMwNiw5
IEBAIGFzbWxpbmthZ2UgX192aXNpYmxlIF9fdHJhcF9zZWN0aW9uIHZvaWQgZG9fdHJhcF9lY2Fs
bF91KHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJCXN5c2NhbGwgPSBzeXNjYWxsX2VudGVyX2Zy
b21fdXNlcl9tb2RlKHJlZ3MsIHN5c2NhbGwpOwogCi0JCWlmIChzeXNjYWxsIDwgTlJfc3lzY2Fs
bHMpCisJCWlmIChzeXNjYWxsID09IC0xKQorCQkJLy8gRG8gbm90aGluZworCQllbHNlIGlmIChz
eXNjYWxsIDwgTlJfc3lzY2FsbHMpCiAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7
CiAJCWVsc2UKIAkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
