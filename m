Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F24010F3DE7
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Mar 2026 13:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u1eXhBNwgtCR4o5wuCq31iHPK1IzYtqEjv7+/uwMqws=; b=QiY0FUWZFsCv5/
	yXRbS0myYoXXcRHDbH98v76n4UlVxRvvk3xQ5CBKLD93TzdCj9swtpBSwFls05XQUtSZMQ+G1g6V1
	wJtRe0iii+RE5bzEovDBUeIdshUJbMAapdodn2KGeRLEi4Vt/xq1gvdzotYHyutTcvtobHigNdok/
	GMesvVDrqkQ/Av4oQ75B44J17k6+LLqcraeLmNt+C/Et9UIPuhbm2Hm7kktyducKmcDBCqn99rjR8
	npSFJQybW2aHNsXQwuT/bACTNNpR/GNQ3gOoV1zve+j6tmS+c4zFMw0zZV8C/3ufE8TgN8iQF3v+S
	ud6UrF1PuwmCNKPLwkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6Ttb-00000008yva-0abb;
	Sat, 28 Mar 2026 13:40:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6TtY-00000008yvC-40mj
	for linux-riscv@lists.infradead.org;
	Sat, 28 Mar 2026 13:40:10 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-823c56765fdso1626962b3a.1
        for <linux-riscv@lists.infradead.org>; Sat, 28 Mar 2026 06:40:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774705207; cv=none;
        d=google.com; s=arc-20240605;
        b=U09eShKPayzgLLA8L89YN3LV6N3blBZE+9l+md+BeIM6AIX1q+p/fpyUj3BTiTTuLI
         mSSdda3o8kqDONJbOYorm5zzKon7NJuCZX8ZDqmsUqX6985Yfq/Zx8N9xrd9gqtVK1zi
         Ha3gVgoHJdkhPP4IJV9ImXPTnXjRUyqDmUwCTclRiEGKxlxAHBzQigaBjgf24Azcw7oN
         oY+tzn4t1MTozOY6BmuowPXB24JdDZoiVkHBNV8/4gQ/JKCM4OzUoCw5aF8vdSSP9U66
         46PpmgmESW+oA9JVXp/kghHQBhkYXSt7cKwUVJZFYhdLI40UWsZotgx1kaxUSOuzmZHH
         WGvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5ZtQ2cHIQnNPmhkNNEc2uIDy13fXSNOA9me1ZOCMupg=;
        fh=FJhesbuUL3eX0wKF5ZV0KMlSHUOCdeZADJ+VsKle/pk=;
        b=Z3JMNtT53a64vqKZXb+NUaJEa9qdd2jzNQ9kWsaRvR/JdaLtMvWVcfMWyse1qbi5Yb
         2qFig0K6emBzRcCQYj82qDga3JnpEjk5/C+AAWYeLSmVUdsu7d7Vz7beJnoLvY3VoVfM
         b1hdghJ05PpxTAcEe3DQNbga3QK5m4TIhgqzyFSs7X3P2suu8TigpUWUbaOnrn2U9ZHk
         aOHMlOprnUOJ+FMHI/z0AB8VrkvZxVcOP9RWtJLDdsVfd1UfZAxrAWISw/pW4EP77ZB3
         u5u7BOBCV1HX+vHOKoO0d2G66GFWXrtmlKaeu2xYdz2o+fVaymKFc3AlvNEbUBY5vY9I
         34JQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774705207; x=1775310007; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZtQ2cHIQnNPmhkNNEc2uIDy13fXSNOA9me1ZOCMupg=;
        b=SN1HT3KtLoKCwuhsQAxtBbS2WaUmRZW+wjhLPS8wVe4pd3AzWAqrgnzOT/aoBIJ/Bz
         VCqMtKws250ZbGxm0mV1TYSiLMikS+Yf/JwUkmUdPr+AMdWWxHBzc6F4Ta29jkrZp8kM
         R67TjNDHnU84VdcrTOHDUB5SK8pnf9Atwd3LoZmfoIyGgRXlw8Zr23ZBbzIO7wVOAdgh
         CNc6nkn7hFU9dTBB4Gc9/fyEeEU6DaGaBCmpVt7uORgetvDl4rwBS4Tm9F7KjKas3KBb
         j5rvPZZXvHZJbj/Oh1qW2n9mml7ogYIjkjgsTQAVR14ocTsXpdoPrwlvilPBpTQ+rz3h
         guoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774705207; x=1775310007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5ZtQ2cHIQnNPmhkNNEc2uIDy13fXSNOA9me1ZOCMupg=;
        b=qA2xcDlMZOYMY2K/UAfHISuxhM+vrk8c+mFUR58bAcv+o29oiyPlc8tiQC7Otgud24
         7gzpAx7MbrzR+fUEezdU/iwaJcAc/3uujzd1VbAq35PndAg2Fx04Kj5z8KFG9f7CyrGN
         ursfZJR5rzklEXw8hnHxGgnVvq+P6eHPIKg7Un30Z9egjNLHcFKqnHjp3xpBJUrD94Sy
         xjY7UHvmHkmWepvwfME5Kn8upwx09CF1Kvgc2KDHGvG886hbspMHWiqtMUIIX8mBFQTl
         EzIG/oowstQIk1XwHGQZTdoouarH0Kbu47bJqgamrWK7I/mE/WpHnrFpadIxOyDwduJo
         WxtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFAsCBEKkEGhg5WsS0dUdDSE8TuYpnXq2eDswI+iMhPj7jNgTkevHTBjSOrJYteAE3WTLjeTdhF69bXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8DOofFEeA2Axp/BSoJ6CtOjzA8Mvceuqrhl8MisYM99+Sb7R3
	l8eMwasuI9n3kzjw99awSzBPJOSjIqivZXpmay+1vwFTb7Gx05qrfAesoL8vhSgbliH/vUO1cAM
	7vQL+KOh6TM0B+l0kb8qrrfVNKgBndr0=
X-Gm-Gg: ATEYQzxY70NaqGw5PathZHeb/uaSirLm5MRWTq3A4+UaCLJPR67baBjWJtEtLO9J9FC
	MShXx44/NlRCAa3xe/yESix6NgEB7jogubzlAHZUNETdATKS1o/jKuF7tADU/6qDWdYq42Tahcn
	HGYGbwttGPnAduT7JOeGYhpL9vqYEcJYF+ZykLDAoixLAlfGqTdkumi5z/3IqqpT6O0djvvWlpb
	B4kQX9GEGDGZzO+F6MTpW4PiPIisq9GdXrepBh1LDBJOocSTJu6SR3Cs88CBHqmLoWmecst2LSZ
	pkB45/k=
X-Received: by 2002:a05:6a00:1789:b0:82a:6de8:fa50 with SMTP id
 d2e1a72fcca58-82c95e45d30mr6453604b3a.18.1774705207164; Sat, 28 Mar 2026
 06:40:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260327114741.91500-1-pilgrimtao@gmail.com> <91bacd7d-6ec0-4888-be0d-f11a6607f38f@acm.org>
In-Reply-To: <91bacd7d-6ec0-4888-be0d-f11a6607f38f@acm.org>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Sat, 28 Mar 2026 21:39:55 +0800
X-Gm-Features: AQROBzBTENtnZtQhxmzRNb76sGSIhzOCRnc5fvzKUgEMLoc4tyX_zU5SvhHxtug
Message-ID: <CAAWJmAZe+pyfju+37-dfjYUdwRR1ae6Rq8OJjZea76d2CPkEMA@mail.gmail.com>
Subject: Re: [RFC 0/2] block: Introduce a BPF-based I/O scheduler
To: Bart Van Assche <bvanassche@acm.org>
Cc: axboe@kernel.dk, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_064009_003461_6D71E8B9 
X-CRM114-Status: GOOD (  18.27  )
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgMTE6NDjigK9QTSBCYXJ0IFZhbiBBc3NjaGUgPGJ2YW5h
c3NjaGVAYWNtLm9yZz4gd3JvdGU6Cj4KPiBPbiAzLzI3LzI2IDQ6NDcgQU0sIENoZW5na2FpdGFv
IHdyb3RlOgo+ID4gSSBoYXZlIGJlZW4gd29ya2luZyBvbiBhZGRpbmcgYSBuZXcgQlBGLWJhc2Vk
IEkvTyBzY2hlZHVsZXIuIEl0IGhhcyBib3RoCj4gPiBrZXJuZWwgYW5kIHVzZXItc3BhY2UgcGFy
dHMuIEluIGtlcm5lbCBzcGFjZSwgdXNpbmcgcGVyLWN0eCwKPgo+IERvZXMgImN0eCIgcGVyaGFw
cyByZWZlciB0byBzdHJ1Y3QgYmxrX21xX2h3X2N0eD8gSWYgc28sIHBsZWFzZSB1c2UgdGhlCj4g
YWJicmV2aWF0aW9uICJoY3R4IiB0byBwcmV2ZW50IGNvbmZ1c2lvbiB3aXRoIHN0cnVjdCBibGtf
bXFfY3R4IChibG9jawo+IGxheWVyIHNvZnR3YXJlIHF1ZXVlKS4KCkhlcmUsIGN0eCByZWZlcnMg
dG8gc3RydWN0IGJsa19tcV9jdHguIFRoZSBpbnRlbnQgaXM6IHdoZW4gbm8gZUJQRgpwb2xpY3kg
aXMgYXR0YWNoZWQsIHRoZSBuZXcgSS9PIHNjaGVkdWxlciBiZWhhdmVzIGxpa2UgdGhlIG5vbmUK
c2NoZWR1bGVyOyB3aGVuIGFuIGVCUEYgcG9saWN5IGlzIGF0dGFjaGVkLCB0aGUgYmxrX21xX2N0
eCBxdWV1ZXMKbWFpbnRhaW5lZCBieSB0aGUgbmV3IEkvTyBzY2hlZHVsZXIgc2VydmUgYXMgYmFj
a3VwIGFuZCBmYWxsYmFjawpmb3IgdGhlIGVCUEYgcHJvZ3JhbS4KCj4gRm9yIHdoYXQgdHlwZSBv
ZiBibG9jayBkZXZpY2VzIGlzIHRoaXMgbmV3IHR5cGUgb2YgSS9PIHNjaGVkdWxlcgo+IGludGVu
ZGVkPyBUaGlzIG5ldyB0eXBlIG9mIEkvTyBzY2hlZHVsZXIgaXMgbm90IGFwcHJvcHJpYXRlIGZv
ciBoYXJkCj4gZGlza3MuIFRvIHNjaGVkdWxlIEkvTyBlZmZlY3RpdmVseSBmb3IgaGFyZGRpc2tz
LCBhbiBJL08gc2NoZWR1bGVyIG11c3QKPiBiZSBhd2FyZSBvZiBhbGwgcGVuZGluZyBJL08gcmVx
dWVzdHMuIFRoaXMgaXMgd2h5IHRoZSBtcS1kZWFkbGluZSBJL08KPiBzY2hlZHVsZXIgbWFpbnRh
aW5zIGEgc2luZ2xlIGxpc3Qgb2YgcmVxdWVzdHMgYWNyb3NzIGFsbCBoYXJkd2FyZQo+IHF1ZXVl
cy4KClRoaXMgbmV3IEkvTyBzY2hlZHVsZXIgdGFyZ2V0cyBtZWNoYW5pY2FsIGhhcmQgZGlza3Mu
IFRoZSBzY2hlZHVsZXIKY2FuIGJlIGF3YXJlIG9mIGFsbCBwZW5kaW5nIEkvTyByZXF1ZXN0cywg
YW5kIHVzZXJzIGNhbiBtYWludGFpbiBhCnNpbmdsZSBsaXN0IG9mIHJlcXVlc3RzIGluIGFuIGVC
UEYgcHJvZ3JhbS4KCj4gQWRkaXRpb25hbGx5LCB0aGlzIG5ldyBJL08gc2NoZWR1bGVyIGlzIG5v
dCBhcHByb3ByaWF0ZSBmb3IgdGhlIGZhc3Rlc3QKPiBibG9jayBkZXZpY2VzLiBGb3IgdmVyeSBm
YXN0IGJsb2NrIGRldmljZXMsIGFueSBJL08gc2NoZWR1bGVyIGluY3VycyBhCj4gbWVhc3VyYWJs
ZSBvdmVyaGVhZC4KCkZvciB0aGUgZmFzdGVzdCBibG9jayBkZXZpY2VzLCBhdm9pZGluZyBleHRy
YSBzY2hlZHVsaW5nIHBvbGljeSBpcwpvZnRlbiB0aGUgYmVzdCBwb2xpY3kuIEluIHNvbWUgY3Vz
dG9taXplZCB3b3JrbG9hZHMsIGhvd2V2ZXIsIGV4dHJhCnBvbGljeSBtYXkgYmUgbmVlZGVkLCBm
b3IgZXhhbXBsZSBwcmlvcml0eSBzY2hlZHVsaW5nLCBjZ3JvdXAtYXdhcmUKZGlmZmVyZW50aWF0
aW9uLCBvciBmaW5lLWdyYWluZWQgbWV0cmljcy4gVGhvc2Ugc2NlbmFyaW9zIGhhdmUgbm90CmJl
ZW4gdmFsaWRhdGVkIHdpdGggcmVhbCBkZW1vcyB5ZXQsIGJ1dCB0aGUgYXBwcm9hY2ggc2VlbXMg
dmlhYmxlLgoKPiA+IEkgaW1wbGVtZW50ZWQKPiA+IGEgc2ltcGxlIGVsZXZhdG9yIHRoYXQgZXhw
b3NlcyBhIHNldCBvZiBCUEYgaG9va3MuIFRoZSBnb2FsIGlzIHRvIG1vdmUgdGhlCj4gPiBwb2xp
Y3kgc2lkZSBvZiBJL08gc2NoZWR1bGluZyBvdXQgb2YgdGhlIGtlcm5lbCBhbmQgaW50byB1c2Vy
IHNwYWNlLAo+Cj4gV2hhdCBkb2VzICJpbnRvIHVzZXIgc3BhY2UiIG1lYW4gaW4gdGhpcyBjb250
ZXh0PyBBcyB5b3Uga25vdyBCUEYgY29kZQo+IHJ1bnMgaW4ga2VybmVsIGNvbnRleHQuCgpTb3Jy
eSwgbXkgd29yZGluZyB3YXMgaW5hY2N1cmF0ZS4gSXQgd291bGQgYmUgbW9yZSBhcHByb3ByaWF0
ZSB0bwpwaHJhc2UgaXQgYXMgImludG8gdXNlci1kZWZpbmVkIEJQRiBwcm9ncmFtcyIuCgotLSAK
WW91cnMsCkNoZW5na2FpdGFvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
