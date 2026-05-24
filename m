Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C963CD5BAB
	for <linux-riscv@archiver.kernel.org>; Sun, 24 May 2026 05:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEN8CJb3CtZqAN7fSlftBAYHZ/XKv/9jF4fvasAe2Vc=; b=qI5QPqKDKrwj2a
	IFRvXlJ2opA26RkUwy+EkQxPFKmN2K0MHOT85+nVinbbghrptEQ4JTcpND87HJBkbXG/AO9+GxIsi
	XhmSTl2KGJa9fKMARdj8whvOcm7YRl8fgz+mSC0OdflmKvdH2HtBRDDaTDvDbwsLW6uAqGinUaz14
	yVv/mjt2vbRHJnpkU8av85zEb0bFdu0AC+hvMfES/DwXVGngj2tiZL4xZkhUyjHZw7EB7RlZOSMlv
	EpEZuZx7B7woDfbSuIBKLc6gX0DFSHX5SSND9cmngID6gdJnCeA9geIDtQOCeu8LASUfp932pWaun
	3vU4TZEPIVsPc+KYjODw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1Lm-0000000EUgf-0T5M;
	Sun, 24 May 2026 05:26:10 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1Lj-0000000EUfP-2puf
	for linux-riscv@lists.infradead.org;
	Sun, 24 May 2026 05:26:09 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-7e61e25199bso289036a34.1
        for <linux-riscv@lists.infradead.org>; Sat, 23 May 2026 22:26:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779600366; cv=none;
        d=google.com; s=arc-20240605;
        b=CRpHa2stmeYEYJ93QyvHKieTb9ICjiU7ZnzHAAp9f0oWl2lWvUZuwSv02GFF9RYb8B
         3hRi/MeqaGeXe7YRt3y6NC30VDi93+vAii8VHeTJ/rCw6hbMv4hmUpW6gHr8V3Bej+Yd
         93ni6lHzlNSXsACpHlZczxagrswm0KWW/rgOM1LO/yGilp8qS94aKLxqm9dEr+7BivBv
         x7Rzba9k7+kVvQZt8wnk0KQLt5kV+53p1dNFJYCPbrp1FiBGd2dlJGWbIoF4HVxrDXJK
         EovcUVz65gSgGqLm1GmiXTA1sUA9vlZv5qPGGy1KMW/2RSL7CWcP7GZqG7MzGGLp4Y4u
         JLqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eE6+eEhD+C63Fu1K/v95BeKlMaBi30euPUmiLWrnqTo=;
        fh=khBgQdHnH7INxh4zMS7eQpwlmmQhAg9+j+RCoteysIA=;
        b=VyEIxtYpOtbOUToj2nDdx5zpidf+TDswey+ozJOc1krl7QgcHgH98DeSgnlKNyo/0o
         wxtqsrLyC/CL7F+CeaJhsntUHXCcuMdjBEAZtGR5VCwFmmp0refziNOQvALRjQdr9B1V
         +TVbekjAeRiePX3Fk6HGsVa5opv9qFiVdsp8j05UgM9xYLSzahQ8qa1/lR9ZVeLz9CwF
         cgg/OGIRVU0avMflkMz9VE8sdTG8ihUJIZH1eDrEkgG9MOURjqzuiJjlOV7EZpG0BqHF
         XaEZAY/v7jnsuVYgsy6kBEat9oyshVaRh9w9D6UdcxA3xWROBopqp7ZQ5Yth1ECzmZhF
         5AAA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779600366; x=1780205166; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eE6+eEhD+C63Fu1K/v95BeKlMaBi30euPUmiLWrnqTo=;
        b=Kcy+YARBghRSr5JfCVc+54sHnItVN70TtUGy8TPen+LF2OA/PMIWZxX3zd3lN/GDRa
         mXCX1VZ5Cp1MIP28R6j1BnsuJ3kVEEA0Wct2lUd2VHxx40Fk1ixd0ue938FR052tuzea
         LfXaGEx1DTz9/rBGr4pF0vZMRxizIthb63JIChNR0Oyp7LljuVEhOcJjTNsR/Hy7UdWE
         3m2tDFmIds96Ra/Cq84zHH6cXKePLlGObvedOACyoGGPDH7LoD3K2+k9l/CF9JQzjpC2
         t1IwBio1+ji9Qye5qFECwhJ3F/X1uCgvSVr8Mxglg6GOiNwnqWgUo9PKLQN+X+HBlLUs
         jNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779600366; x=1780205166;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eE6+eEhD+C63Fu1K/v95BeKlMaBi30euPUmiLWrnqTo=;
        b=MuhaEXpcyjJw+69GaLo+UxQRO+1CALhdtb0nhqEXvu91xw8+HS6LJXxGmWydksJbxQ
         gI0ImP7eoIEQCpJM7tmUkYi/bzqsd0GjWG268FToxdDmpcuUpTqxt5AnyCf8mRi3ukxl
         rADgKwBEtUp4h9Z72cy8GqIuTXxOccTY16t8Jx5oVvqrs2/b1xxah1G1pv4l2paJJS3r
         73T0ZAIlomPfy3wYKw8WFYEU3r5xZ5Z32vE9lgEAdNhHqXGhRIwyd3pAbic4G0W6TpnW
         U2EHH1cnpDB7exRca3Lu+JEGcOLVlX0Wen7bGnEETCA6OePJ1/TZ1Mjda1IKhjVxxoK1
         Nt0g==
X-Forwarded-Encrypted: i=1; AFNElJ+BiHCsB5jOBr+uuLMFgsCezbuaBssJ1ZpzSyqlMBy0QJFqMlH2WjYADCx3rUhD5JCxIZDjVjDVHTw+Gg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxvpUgAllUDQ55PQVIUmD4eZqLSs2tV5QcAakiWZNp1eHSPwYvr
	zgU967SCzr1BWTDb1OPBU/eEoRWdmx/vpYtHwZy/MEX0U86kppL6oxzfEDzUN5eq3y0eBhT93sP
	Uql8SQcsRpfZXTG9XxWgiMY5zs9ueoLwyC4UMVS/q9Q==
X-Gm-Gg: Acq92OEZq2U5/3XkAfybI/55iHNr38N5HyPlWNZtor4UTtzu+hxJvD3whKpLaNBb350
	D9vusG7JgptL1M3db1Yi/W193ewQsVxIKdT5Whx9G96+oaJmI75Fpruis6BcoXrxvGaQkTWADy6
	Sn336E+7feULpBKKpzBX7ZXcakCYXccGKz1O0CTLaqeaYqwH52k4GbZomyd/inj5kKvOOqqG8KM
	Fm9VRt/6Na/Wjx7dzAcmg+LNy+hQbL5OTMHrxeTEhpop9eZwC7G+z1wNasJKXUnxLxbIjSzW/zV
	084WFJ9nlkNXcMC1gG7I2R2lMF6S+1UcmIoi6SA6JSJBUp7FEet3I74Nj0jl1ERgmrsogRao8ID
	iXb0iP8/nXPYMua/BG69s8NbzChI=
X-Received: by 2002:a05:6820:868b:b0:69b:5f97:de79 with SMTP id
 006d021491bc7-69d7eb91b64mr4064957eaf.19.1779600366573; Sat, 23 May 2026
 22:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org>
In-Reply-To: <20260425005916.3321811-1-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 May 2026 10:55:55 +0530
X-Gm-Features: AVHnY4JBNFDLe44QojpCNBOQNUnwD6PWyRl75taA_4p2OczkddPd-j2jxpb_QyM
Message-ID: <CAAhSdy3T32AuG=MujHOhjw08h7h8UAyYjkORVNxUgR77Gn1ZWQ@mail.gmail.com>
Subject: Re: [PATCH V2 0/4] RISC-V: KVM: AIA: Convert HGEI management to fully per-HART
To: guoren@kernel.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, gaohan@iscas.ac.cn, 
	inochiama@gmail.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, me@ziyao.cc, 
	palmer@dabbelt.com, pjw@kernel.org, tglx@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_222607_719946_02883BE8 
X-CRM114-Status: GOOD (  14.63  )
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

T24gU2F0LCBBcHIgMjUsIDIwMjYgYXQgNjoyOeKAr0FNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBUaGlzIHNob3J0IHNlcmllcyBjb252ZXJ0cyBSSVNDLVYgS1ZNIEFJQSdz
IEh5cGVydmlzb3IgR3Vlc3QgRXh0ZXJuYWwKPiBJbnRlcnJ1cHQgKEhHRUkpIGxpbmUgbWFuYWdl
bWVudCBmcm9tIGEgZ2xvYmFsICJvbmUtc2l6ZS1maXRzLWFsbCIKPiBtb2RlbCB0byBhIGZ1bGx5
IHBlci1IQVJUIChwZXItQ1BVKSBtb2RlbC4gSXQgYWxzbyBwZXJmb3JtcyB0aGUKPiBjb3JyZXNw
b25kaW5nIGNsZWFudXAgaW4gdGhlIElNU0lDIGlycWNoaXAgZHJpdmVyLgo+Cj4gVGhlIG1vdGl2
YXRpb24gaXMgdG8gcHJvcGVybHkgc3VwcG9ydCBoZXRlcm9nZW5lb3VzIFJJU0MtViBTb0NzCj4g
KGJpZy5MSVRUTEUsIG11bHRpLXZlbmRvciBjb3JlIG1peGVzKSB3aGVyZSBkaWZmZXJlbnQgSEFS
VHMgbWF5Cj4gZXhwb3NlIGRpZmZlcmVudCBudW1iZXJzIG9mIGd1ZXN0IGludGVycnVwdCBmaWxl
cyAvIEhHRUlFIGJpdHMuCj4gVGhlIG9sZCBnbG9iYWwgYGt2bV9yaXNjdl9haWFfbnJfaGdlaWAg
YW5kCj4gYGltc2ljX2dsb2JhbF9jb25maWc6Om5yX2d1ZXN0X2ZpbGVzYCBhc3N1bXB0aW9ucyBh
cmUgbm8gbG9uZ2VyCj4gdGVuYWJsZSBhbmQgYXJlIHJlbW92ZWQuCj4KPiBBZnRlciB0aGlzIHNl
cmllcywgSEdFSSBhbGxvY2F0aW9uLCBmcmVlaW5nLCBhbmQgaW50ZXJydXB0IGRlbGl2ZXJ5Cj4g
YXJlIGNvbXBsZXRlbHkgcGVyLUhBUlQsIHRoZSBjb2RlIGlzIHNpbXBsZXIgYW5kIGNsZWFyZXIs
IGFuZCB0aGVyZQo+IGFyZSBubyByZW1haW5pbmcgZ2xvYmFsIGFzc3VtcHRpb25zIGFib3V0IGd1
ZXN0IGludGVycnVwdCBmaWxlCj4gY291bnRzLgo+Cj4gQ2hhbmdlbG9nOgo+IFYyOgo+ICAtIEFk
ZCBwZXItSEFSVCBJTVNJQyBndWVzdCBmaWxlcyB0byBjb21wdXRlIGZpbmFsIEhHRUkgY291bnQu
Cj4gIC0gQWRkIG1pbihsb2NhbC0+bnJfZ3Vlc3RfZmlsZXMsIG5yX2d1ZXN0X2ZpbGVzKTsKPgo+
IFYxOgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2t2bS1yaXNjdi8yMDI2MDQyMTE0NTQ1MS4x
NTk3OTMwLTEtZ3VvcmVuQGtlcm5lbC5vcmcvCj4KPiBHdW8gUmVuIChBbGliYWJhIERBTU8gQWNh
ZGVteSkgKDQpOgo+ICAgUklTQy1WOiBLVk06IEFJQTogTWFrZSBIR0VJIG51bWJlciBhbmQgbWFu
YWdlbWVudCBmdWxseSBwZXItQ1BVCj4gICBSSVNDLVY6IEtWTTogQUlBOiBSZXBsYWNlIGdsb2Jh
bCBIR0VJIGNvdW50IHdpdGggc2ltcGxlIGVuYWJsZWQgYm9vbAo+ICAgaXJxY2hpcC9yaXNjdi1p
bXNpYzogTW92ZSBucl9ndWVzdF9maWxlcyB0byBwZXItSEFSVCBsb2NhbCBjb25maWcKPiAgIFJJ
U0MtVjogS1ZNOiBBSUE6IFVzZSBwZXItSEFSVCBJTVNJQyBndWVzdCBmaWxlcyB0byBjb21wdXRl
IGZpbmFsIEhHRUkKPiAgICAgY291bnQKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9h
aWEuaCAgICAgICAgfCAgMiArLQo+ICBhcmNoL3Jpc2N2L2t2bS9haWEuYyAgICAgICAgICAgICAg
ICAgICAgfCA2NiArKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL2Fp
YV9kZXZpY2UuYyAgICAgICAgICAgICB8ICA0ICstCj4gIGFyY2gvcmlzY3Yva3ZtL21haW4uYyAg
ICAgICAgICAgICAgICAgICB8ICAzICstCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlzY3YtaW1z
aWMtc3RhdGUuYyB8IDEwICsrLS0KPiAgaW5jbHVkZS9saW51eC9pcnFjaGlwL3Jpc2N2LWltc2lj
LmggICAgIHwgIDYgKy0tCj4gIDYgZmlsZXMgY2hhbmdlZCwgNTMgaW5zZXJ0aW9ucygrKSwgMzgg
ZGVsZXRpb25zKC0pCj4KPiAtLQo+IDIuNDMuMAo+CgpJIHdpbGwgc2VuZCBvdXQgdjMgc2VyaWVz
IHRvIGF2b2lkIHNvbWUgYmFjay1uLWZvcnRoLgoKUmVnYXJkcywKQW51cAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
