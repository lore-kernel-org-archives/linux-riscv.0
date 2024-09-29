Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93557CF6491
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Sep 2024 03:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/599rekU/So5lqrHVeNp0y9EU5vFxaecNybRHRaUWk=; b=Wrs6OaLSAXb/Wt
	EnEXYEAB7Mnoxl8ROUkjCNmfRPKXHRW1CLUFpSiIjStvlpT+v8l+MwjPK476p1Pxjg1pasyCbl08e
	5o7xyre+eljQDVSqVexaaoll2DEpTdpVn9xxpHh+PRRaUY/OJ9xVEzU7lY2Q7sb/H2VqRCm+Dp+vH
	Ey13ixv4fnl5nd8+oTpIz2MoV0wCHKb9XKs+4TRaZFwAFGT5oPy+0GemlNv+tuVQ6NyNrKWy685x9
	AfGktRDaOSgcqd3uTdXWwmfVyVdu+/TWV6P+GNo9pxu6iNbxhBcqhsW1xmtRylhe8HMgPCGebgvOn
	AfeGius5jeShiw3CSj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sukcl-0000000E310-1BIv;
	Sun, 29 Sep 2024 03:29:31 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sukch-0000000E30T-1Q8L
	for linux-riscv@lists.infradead.org;
	Sun, 29 Sep 2024 03:29:29 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-718e285544fso2609677b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Sep 2024 20:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727580562; x=1728185362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dfBViO5Wb0kN2stfIe5/qkFQG0sPtWRnmVYMH3w1hMI=;
        b=XKCK7Om12TZkNxtXyq3EPeZHlTOvPiR3Dnm8o+kyfjOz355YVtMVrY71cgo70TOjhN
         Qpx4aWv0unm26GPSOLKsgck23XflEHDaIWF75S8otmys2cbjgpq9iEM+biKJoBJJxcn6
         i1t/AM4//+DMmNXNzNMciWnIL7a5VxvMQ9UqIaNoJIaFhKwwR++muCwf7ZX0RLrDM6/F
         WQRb857plBs0Gh6OTwY8CYL6lVLpwVoXstsXjLYjI+rC7JSNnje3DFQNyD1yE7ZhAphD
         UbdMYnt+9FNyV+gGr0LIqax1oxGptm07svMJ8ysqOmQXiDdOL4SOx5+EPX5bKzbuHZeB
         aNzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727580562; x=1728185362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dfBViO5Wb0kN2stfIe5/qkFQG0sPtWRnmVYMH3w1hMI=;
        b=Kp0VDuqXUw5lHQNRRyebnYy3odQ8Ff4O7qaEp/i3TwL9A2fPuIWA5QsDfPCBr6/kbi
         l3wiSNqvtubjEKLrzjFVmbznFKuADEw8i4Zbx/mOlTNKnDLZJBhAh+UwbOy0nS3abUPd
         Tnz+jicKGQJ30WElFaVRdzn5rObygkHy+4kNgZKR2xdxvQrqx80yNaJr/2t5avLUBCB7
         MYpmN/52C/q8T/NcGyfrfvo5BBi+027HrcWWWn7JUJiYESzmk/utrljxL+odAe6FnKna
         nBkpWFqmQ2coreCQ52QXm3VnrMHU55oRMn6UiFt1mnTbk9roWRAupHIGkByNxYKrgD97
         N1pg==
X-Gm-Message-State: AOJu0YzxJwJfjt4tNUS+63wzS+83TjQOmr6k0dobRxU3cMUzatKMBihy
	mPVia486Ht79oSyJ5820umskICOP9rX672M1HiqjOjb3kRB4HmwVOLwgwpO0gDdSnFLibuD6Ga5
	6BWsjxBffZWJQ64uCuiffQaqQyrFfykFmKPoAYw==
X-Google-Smtp-Source: AGHT+IFPLg2G1qd+nE0y655DKt+mOk9bU9eCV7wDSgZin3YMEXnTz0TUl6o3OH7259LgyNyxl2hkAZ88V1fyzvnUXkw=
X-Received: by 2002:a05:6a00:1702:b0:714:43d2:920f with SMTP id
 d2e1a72fcca58-71b26070223mr12223254b3a.25.1727580562451; Sat, 28 Sep 2024
 20:29:22 -0700 (PDT)
MIME-Version: 1.0
References: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
In-Reply-To: <878qvbzqfx.fsf@oldenburg.str.redhat.com>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Sun, 29 Sep 2024 11:29:11 +0800
Message-ID: <CAPYmKFtWPxEvD7v4FfN1n=YGuYCKgFFm7SNer5-GF95OBTMG+Q@mail.gmail.com>
Subject: Re: [External] Page sizes supported by RISC-V
To: Florian Weimer <fweimer@redhat.com>
Cc: linux-riscv@lists.infradead.org, Jeff Law <jeffreyalaw@gmail.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Punit Agrawal <punit.agrawal@bytedance.com>, 
	wangpengcheng.pp@bytedance.com, Hangjing Li <lihangjing@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240928_202927_682195_75934A64 
X-CRM114-Status: GOOD (  19.77  )
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

SGkgRmxvcmlhbiwKCgpPbiBTdW4sIFNlcCAyOSwgMjAyNCBhdCAxMjozNuKAr0FNIEZsb3JpYW4g
V2VpbWVyIDxmd2VpbWVyQHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gSSdtIHdvcmtpbmcgb24gYWRk
aW5nIGEgPHN5cy9wYWdlc2l6ZS5oPiBoZWFkZXIgdG8gZ2xpYmMsIHNvIHRoYXQKPiBwcm9ncmFt
bWVycyBjYW4gZWFzaWx5IGRldGVybWluZSB0aGUgcmFuZ2Ugb2YgcG9zc2libGUgcGFnZSBzaXpl
cyBmb3IgYQo+IHBhcnRpY3VsYXIgdGFyZ2V0LCBmb3IgdGhpbmdzIGxpa2UgcG9pbnRlciB0YWdn
aW5nIGFuZCBtYXBwZWQgZmlsZQo+IGFsaWdubWVudCByZXF1aXJlbWVudHMuCj4KPiBMaW51eCBj
dXJyZW50bHkgc3VwcG9ydHMgNCBLaUIgcGFnZXMgb25seS4gIEkgY291bGRuJ3QgZmluZCBhbnl0
aGluZyBpbgo+IHRoZSBSSVNDLVYgc3BlY2lmaWNhdGlvbnMgdGhhdCBtYW5kYXRlcyBhIHNwZWNp
ZmljIHBhZ2Ugc2l6ZSwgYnV0IG9mCj4gY291cnNlIHRoZSB3YXkgRUxGIExPQUQgc2VnbWVudHMg
YXJlIGNvbnN0cnVjdGVkIG5lY2Vzc2FyaWx5IGltcG9zZXMgYQo+IG1heGltdW0gcGFnZSBzaXpl
IGNvbnN0cmFpbnQgZm9yIHBhcnRpY3VsYXIgZXhlY3V0YWJsZXMuICBUb2RheSwgdGhlCj4gdG9v
bGNoYWluIGFzc3VtZXMgdGhlIG1heGltdW0gc3VwcG9ydGVkIHBhZ2Ugc2l6ZSBpcyA0IEtpQiwg
YW5kIHRoaXMgaXMKPiBhbHNvIHJlZmxlY3RlZCBpbiBhcmNoL3Jpc2N2L0tjb25maWcgaW4gdGhl
IExpbnV4IHNvdXJjZXMgKGFzIGZhciBhcyBJCj4gY2FuIHJlYWQgS2NvbmZpZykuCgpZZXMsIFJJ
U0MtViBrZXJuZWwgc3VwcG9ydHMgb25seSA0SyBwYWdlIHNpemUgbm93LiBJIHBlcnNvbmFsbHkg
dGVuZAp0byBzdXBwb3J0IG1vcmUgcGFnZSBzaXplcy4gV2UgaGF2ZSB0ZXN0ZWQgNjRLIGtlcm5l
bCBwZXJmb3JtYW5jZSBvbgpBUk0gQW1wZXJlIEFsdHJhIHBsYXRmb3JtIGFuZCBmb3VuZCBtdWx0
aXBsZSBtZW1vcnktaW50ZW5zaXZlIGFwcHMnCnBlcmZvcm1hbmNlIGJhc2VkIG9uIDY0SyBwYWdl
IGtlcm5lbCBpcyBzaWduaWZpY2FudGx5IGhpZ2hlciB0aGFuIHRoYXQKb24gNEsgcGFnZSBrZXJu
ZWwuCgo+Cj4gSSBmb3VuZCBhIHByZXZpb3VzIHByb3Bvc2FsIGZvciBrZXJuZWwgc3VwcG9ydCBv
ZiA2NCBLaUIgcGFnZXM6Cj4KPiAgIFtSRkMgUEFUQ0ggVjEgMDAvMTFdIHJpc2N2OiBJbnRyb2R1
Y2UgNjRLIGJhc2UgcGFnZQo+ICAgPGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2
LzIwMjMxMTIzMDY1NzA4LjkxMzQ1LTEtbHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbS8+CgpUaGlz
IGlzIG91ciBmaXJzdCB2ZXJzaW9uIG9mIDY0SyBwYWdlIGltcGxlbWVudGF0aW9uWzBdLCB3aGlj
aCBpcwpiYXNlZCBvbiBTdm5hcG90IGV4dGVuc2lvbiBhcyBSSVNDLVYgZG9lcyBub3Qgc3VwcG9y
dCA2NEsgTU1VIHlldC4gVGhlCm1haW4gaWRlYSBvZiBpdCBpcyBhbGxvY2F0aW5nL21hcHBpbmcg
cGFnZXMgaW4gNjRLIGdyYW51bGFyaXR5IGFuZAphbHdheXMgYXBwbHlpbmcgU3ZuYXBvdCBvbiBw
dGVzLiBUaGUgZmlyc3QgdmVyc2lvbiBpcyBvbmx5IGEgZGVtbyBhbmQKc3RpbGwgaGFzIHNvbWUg
YnVncy4gV2UgaGF2ZSBmaXhlZCBleGlzdGluZyBwcm9ibGVtcyBhbmQgdGVzdGVkIGl0cwpwZXJm
b3JtYW5jZSwgYnV0IGZvdW5kIHRoYXQgaXRzIHBlcmZvcm1hbmNlIGJlbmVmaXQgaXMgbm90IGFz
CnNpZ25pZmljYW50IGFzIHdlIHJlY2VpdmVkIG9uIEFSTSA2NEsuIFdlIHRoaW5rIHRoZSBwZXJm
b3JtYW5jZQpiZW5lZml0IGRlZ3JhZGF0aW9uIG1haW5seSBjb21lcyBmcm9tIHNvZnR3YXJlIGxv
Z2ljIG9mIGltaXRhdGluZyA2NEsuCkZvciBleGFtcGxlLCB3aGVuIG5lZWQgdG8gdGxiIGZsdXNo
IGEgcGFnZSwgaW5zdGVhZCBvZiB1c2luZyBhIHNpbmdsZQp0bGIgZmx1c2ggaW5zdHJ1Y3Rpb24s
IHdlIGhhdmUgdG8gZmx1c2ggYWxsIDRLIHBhZ2VzIG9mIGEgc2luZ2xlIDY0SwpwYWdlIGluIGEg
bG9vcCBsb2dpYy4gQW5kIHdoZW4gbmVlZCB0byBjaGVjayBwdGUgYWNjZXNzL2RpcnR5IGJpdCwK
aW5zdGVhZCBvZiBjaGVja2luZyBhIHNpbmdsZSBwdGUsIHdlIGhhdmUgdG8gY2hlY2sgYWxsIDRL
IHB0ZXMgb2YgYQpzaW5nbGUgNjRLIHBhZ2UgaW4gYSBsb29wIGxvZ2ljLiBUaGUgbmV4dCB2ZXJz
aW9uIG9mIHBhdGNoZXMgYW5kIGl0cwpwZXJmb3JtYW5jZSBkYXRhIGlzIHN0aWxsIGJlaW5nIG9y
Z2FuaXplZCBhbmQgd2lsbCBiZSBwdWJsaXNoZWQgYXMKc29vbiBhcyBwb3NzaWJsZS4KClRodXMs
IHdlIGFyZSBhbHNvIHRyeWluZyB0byBjYWxsIGZvciBuYXRpdmUgNjRLIE1NVSBpbiBSSVNDLVYK
Y29tbXVuaXR5LiBZb3UgY2FuIGZpbmQgdGhlIGRpc2N1c3Npb24gaW4gbGluayBbMV0uIFdlIGhv
cGUgbW9yZQpwZW9wbGUgY2FuIHBhcnRpY2lwYXRlIGluIHRoZSBkaXNjdXNzaW9uIGFuZCBwcm92
aWRlIG1vcmUgZGF0YQpzdXBwb3J0LgoKWzBdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXJpc2N2LzIwMjMxMTIzMDY1NzA4LjkxMzQ1LTEtbHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbS8K
WzFdIGh0dHBzOi8vbGlzdHMucmlzY3Yub3JnL2cvdGVjaC1wcml2aWxlZ2VkL3RvcGljL3F1ZXJ5
X2Fib3V0X3Jpc2Nfdl9zX3N1cHBvcnQvMTA4NjQxNTA5CgpCZXN0IHJlZ2FyZHMsCgpYdSBMdQoK
Pgo+IElzIHRoaXMgc29tZXRoaW5nIHdlIHNob3VsZCBjb25zaWRlciB0b2RheT8KPgo+IEknbSBs
ZWFuaW5nIHRvd2FyZHMgdGVhY2hpbmcgZ2xpYmMgdGhhdCB0aGUgUklTQy1WIHBhZ2Ugc2l6ZSBp
cyBhbHdheXMKPiA0IEtpQiBiZWNhdXNlIGdpdmVuIHRoZSBjdXJyZW50IHRvb2xjaGFpbiBkZWZh
dWx0cywgaXQncyBuZWNlc3NhcnkKPiB0byByZWJ1aWxkIHRoZSB3b3JsZCBhbnl3YXkgaWYgc3Vw
cG9ydGVkIHBhZ2Ugc2l6ZXMgZXZlciBjaGFuZ2UuCj4KPiBUaGFua3MsCj4gRmxvcmlhbgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
