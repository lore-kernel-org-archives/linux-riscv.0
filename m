Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1B9CA601F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2026 18:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0agw+9HDeNVy6VKMS1X4yBoWZ+aPKMApPlKDA2YOAcU=; b=jEqHQfts9Ziqkg
	EGqB9IrLzsV5dqg0vm06S2Fq9ijJ1qAO3kYCSCrDyp98PjvWCG70djV0YN16VjocMIbZZdvU3bc8z
	MCWxUs+mETuBDNvqixKF8rsNgtW0HIjvWoLImHmhU1r0/eKsbOv/ZNEYZdlhSwkubrRxnxCAwdsT6
	/JprJXinBLjogWwFkz7lLPbtuVIH8Ofuuu5gHUQFhXYJSoJz3TgbHPqP0nmZokELVdtC8b1JON9lo
	Z1g6H+q534vVDmmDNvs2aMD3JmCgp8+Pw7RO2CIAF968AgQcJDEmXMtAmBqXAr3rQVLGpnmq6CA4+
	Yjy1XsVrTywWvZYm1xiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFS6-0000000705K-3IDF;
	Fri, 09 Oct 2026 18:36:19 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFFS3-0000000702p-1jqD
	for linux-riscv@lists.infradead.org;
	Fri, 09 Oct 2026 18:36:16 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-48c5358fc28so86664f8f.0
        for <linux-riscv@lists.infradead.org>; Fri, 09 Oct 2026 11:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791570974; cv=none;
        d=google.com; s=arc-20260327;
        b=sxP7jYXjuGkeIbDK3wt9nvZUx6jaNiaj5U8DA1VJ2hLrKNrOglaRJ1V1mPtpaMvJPA
         yHQfzqq0VyQAFH/VelF54vDWD6W71Jbl3IVwEezg3FYoTT3DWdFUnD+S33P6+U8QO4UN
         LVaACXr20efvamM+oPi6FqVatlN45o22YJ/Gko1A6SsVWz0INn7x4wzULxGKh2m8h2zh
         tbbTywywPxRg4xChQDA58QelYGUvGJi5GOIYjJRpjeBlte+7QoIDJeDrjCup0Ih8LP6Z
         JJPi55w0QF/1Rt1iYVeGWwcR4rwTASVjZNNrNun4YPf1Hl4TSc+EWSkArmi+85onVojU
         BI+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        fh=mRhgI26Nb67G25uo3JVAABo5DPbsrQfHslb9B3dBg6U=;
        b=bDSgnZLDCyPmUL6l2OL5dWRrc4wrhcgOmj2rSLl0/8pJeyWkPGtdvmm6ion7vr+74O
         XTEl8Iz4mjkAcQAWYLw8BMckaJhI7ZZIg12FyUdYVJzhJOrNOspucJnrOb7w6z0bMgXM
         1QF61Z6qeYINQByDQiVc5eZ0NWloctHN0tPPhZTwN8kJG6HYImlyU01oFuy08Q4F1CI3
         EYrip7atvrLev/nazzt0qVXPFmpy6LM0w4shXGZZ5wNdVxMlPoYS0Ztul8kaoRtQy3WV
         zGF2mgL/Pj8OHwTQcfmoiGp/UU8JZ83W+9wXmzEHP8plcEi+xynnKqXZDVhw80bzgNcm
         xU7Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791570974; x=1792175774; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        b=fIMv2CwEVy1LZZbLr5qs1Ih8QvE8vFrSqb/vFEDK8v4jKRQzI5ZDOT5aY3bg/osCWD
         U/+mDigJTnUu7XTRBNw1JbA96ssfM/8mQbNRJjyYqClTd6aapIT7CiHHqNXuAjQP7pAL
         860i4S9FPJII+ezUJ6l3Cspx77JXt2heioGB7OZYF7yMWIjscjWyHGfO9bQ8xdDWSQlf
         2YV2Wc956cIcvqJrkg38OjWqTgSRREgNx+pa5UxOukQZme2ETPuBpdbqR9xXnWtU/IaC
         Ac4D2sjMui1u91VvV/jFmsO/7L18dqj9oWN32oTnDDd0gP8ZtSalyXvHwiL7bcOxmfzt
         Y/SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570974; x=1792175774;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aAdMtSkSU+PJixhSHS4YKBFzW6UF4o8VzS6cRINAxt8=;
        b=ALnviCeerasGIIzrps2Nfb8B/B0AjoX2l61Cfxak0DPL2mbZakClFYH/NGAEPUvEov
         WRi7MAYwk+QFsDy4IkcJ+0rzE1E6UQ38VaZ9Rv9R78dOcDnCUDYXIpF+FqlT51TvAMbL
         sKsLQeD0YW+qQFXQCNVwPgNu+gjPY/ae+WwvmyjjRujFYDdJygSSAYLqbFmBwJ5k7LYS
         UXxoy+RhdamZBNhWUX7ErR4fwQNAGfTMm3cna1C3yYFhhBU+TjMq/XTVf8t0DSrn9M3+
         M5lvm04ekAl1iKXo/h7ihOLhVff5sKNod+42ry0lX2Za7u/6GSsA+CIjDZHRKM4ofEJ4
         poOg==
X-Forwarded-Encrypted: i=1; AKwUvBxAa6v3sUutFhIroa4ZYsYEDNoJbPitHYKOLsmLkfT+Z6UKQjxGU88LdSK69tFv2Df5yjRcOo5xlS/ABg==@lists.infradead.org
X-Gm-Message-State: AFq9FYL17OWcz2Asb5+2+bHHmqwoCJ9aZa7W1fMKaHdA0Bp+F5rn7geU
	zofdAz0BZ1Ej9gGYgD3ht79TxIyn0KuZ3XrfPEpF76zHHaP2EACgTYfAKEw8Zs4yJpSA0DAZUrP
	0qgnAqqVKLH2ltrGQ2ifsBS7iqOyHd+saMTbvpxpPDg==
X-Gm-Gg: AYBFou39+elJg7Gcq+gx1a3pMWgs+0j/46/Z3US4qtDVFYYGiCmYn7TDFtsKG10lFaj
	cDDDCPrArQma5fM8h48+ed2NpRnWBMT2ASYSNOVhbRw2XgHfu340E3Bavop/ZQlNzFxXBP0lMsq
	4q+gss/Jdo7Duile2/YAcapqsgaPLWHjVDR2b5M9vBf24WAmFj/PFC1b/Du88eVWp/B5Iqz9dk1
	SzjYSoJers9y3YYXzZTGBJw9n4wGfvZ8/9eY9WnXoGzqqRPc7yeqQtl4qUVcbdVFKKC1aNrYMD/
	pEK+FnOnwM/y7GYQUAkcwyYrXbS3b8tR8lpY+zk6O7Phb0VwG2k/2whR4HDYx+nBriH/4CznAB6
	cbspAN/aazS8h0iI57QtZ8B+EftMF+BFXYwTRPNHZmBgeNioLZ7JJ8Y+CLYFgU6DqpXXwfPQmxg
	==
X-Received: by 2002:adf:f147:0:b0:488:8ab9:f73e with SMTP id
 ffacd0b85a97d-48dbaae4878mr3989428f8f.24.1791570973627; Fri, 09 Oct 2026
 11:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260911152314.1076817-1-wenlongli486@gmail.com>
In-Reply-To: <20260911152314.1076817-1-wenlongli486@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 9 Oct 2026 20:36:02 +0200
X-Gm-Features: AclHuK-TLWsKgkGzLv0QJ_8v3oC-5fn5auBcEXlemKFFcSbIf24vnAAecN-RL7k
Message-ID: <CAAhSdy0zM+g=roVNZcQi5eV_=kpPM1TvsgenTd8WEeoX7-tyWA@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: KVM: Avoid synchronous IPIs on VMID rollover
To: Wenlong Li <wenlongli486@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Quan Zhou <zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_113615_650867_325AFAAF 
X-CRM114-Status: GOOD (  20.70  )
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

T24gRnJpLCBTZXAgMTEsIDIwMjYgYXQgNToyNOKAr1BNIFdlbmxvbmcgTGkgPHdlbmxvbmdsaTQ4
NkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlIGN1cnJlbnQgVk1JRCByb2xsb3ZlciBwYXRoIHN5
bmNocm9ub3VzbHkgaW52b2tlcyBIRkVOQ0UuR1ZNQSBvbgo+IGFsbCBvbmxpbmUgQ1BVcyB1c2lu
ZyBvbl9lYWNoX2NwdV9tYXNrKCkuIFRoaXMgc2VuZHMgSVBJcyB0byByZW1vdGUKPiBDUFVzIGFu
ZCBjYXVzZXMgYSB2Q1BVIHJ1bm5pbmcgaW4gZ3Vlc3QgbW9kZSBvbiBhIHRhcmdldGVkIENQVSB0
byBleGl0Lgo+IFRoZSByb2xsb3ZlciBwYXRoIHRoZW4gd2FpdHMgZm9yIGFsbCBDUFVzIHRvIGNv
bXBsZXRlIHRoZWlyIGxvY2FsIFRMQgo+IGZsdXNoZXMgYmVmb3JlIFZNSUQgYWxsb2NhdGlvbiBj
YW4gY29udGludWUuCj4KPiBNYWtlIFZNSUQgcm9sbG92ZXIgbGF6eSB0byByZW1vdmUgdGhpcyBj
cm9zcy1DUFUgc3luY2hyb25pemF0aW9uLgo+Cj4gVHJhY2sgYWN0aXZlIGFuZCByZXNlcnZlZCBz
b2Z0d2FyZSBWTUlEcyBmb3IgZWFjaCBwb3NzaWJsZSBDUFUuIE9uCj4gcm9sbG92ZXIsIHByZXNl
cnZlIGhhcmR3YXJlIFZNSURzIHRoYXQgbWF5IHN0aWxsIGhhdmUgc3RhbGUKPiB0cmFuc2xhdGlv
bnMsIGNsZWFyIHRoZSBhY3RpdmUgVk1JRCwgYW5kIG1hcmsgYSBsb2NhbCBUTEIgZmx1c2gKPiBw
ZW5kaW5nIGZvciBlYWNoIENQVS4KPgo+IERvIG5vdCBzZW5kIElQSXMgb3Igb3RoZXJ3aXNlIGZv
cmNlIHJlbW90ZSB2Q1BVcyB0byBleGl0IGR1cmluZwo+IHJvbGxvdmVyLiBJbnN0ZWFkLCB3aGVu
IGEgQ1BVIG5leHQgYWN0aXZhdGVzIGEgVk1JRCBiZWZvcmUgZ3Vlc3QKPiBlbnRyeSwgcGVyZm9y
bSB0aGUgcGVuZGluZyBsb2NhbCBIRkVOQ0UuR1ZNQSwgaW5zdGFsbCB0aGUgY3VycmVudAo+IGhh
cmR3YXJlIFZNSUQgaW4gSEdBVFAsIGFuZCBvbmx5IHRoZW4gcHVibGlzaCB0aGUgbmV3IGFjdGl2
ZSBWTUlELgo+Cj4gVXNlIHRoZSBzYW1lIHNvZnR3YXJlIFZNSUQgc25hcHNob3QgZm9yIGJvdGgg
SEdBVFAgcHJvZ3JhbW1pbmcgYW5kCj4gYWN0aXZlIHB1YmxpY2F0aW9uLiBXaGVuIHN3aXRjaGlu
ZyBpZGVudGl0aWVzIG9uIHRoZSBmYXN0IHBhdGgsIHByb2dyYW0KPiBIR0FUUCBiZWZvcmUgY21w
eGNoZy4gQSBjb25jdXJyZW50IHJvbGxvdmVyIGNsZWFycyBhY3RpdmUsIG1ha2luZyB0aGUKPiBj
bXB4Y2hnIGZhaWwgYW5kIGZvcmNpbmcgYWN0aXZhdGlvbiB0aHJvdWdoIHRoZSBsb2NrZWQgc2xv
dyBwYXRoLgo+Cj4gUGVyZm9ybSBWTUlEIGFjdGl2YXRpb24gYWZ0ZXIgcHJlZW1wdGlvbiBpcyBk
aXNhYmxlZCBpbiB0aGUgZ3Vlc3QKPiBlbnRyeSBwYXRoLiBUaGlzIGtlZXBzIHRoZSBwZXItQ1BV
IGFjdGl2ZSBWTUlEIGFuZCBwZW5kaW5nIGZsdXNoIHN0YXRlCj4gYXNzb2NpYXRlZCB3aXRoIHRo
ZSBzYW1lIENQVSB0aGF0IHN1YnNlcXVlbnRseSBlbnRlcnMgZ3Vlc3QgbW9kZS4KPgo+IEtlZXAg
cmVzZXJ2ZWQgaGFyZHdhcmUgVk1JRHMgdW5hdmFpbGFibGUgdG8gdGhlIGJpdG1hcCBhbGxvY2F0
b3IKPiB3aGlsZSBzdGFsZSB0cmFuc2xhdGlvbnMgYXNzb2NpYXRlZCB3aXRoIHRoZW0gbWF5IHN0
aWxsIGV4aXN0LiBUaGlzCj4gcHJldmVudHMgYSBoYXJkd2FyZSBWTUlEIGZyb20gYmVpbmcgcmV1
c2VkIHByZW1hdHVyZWx5IGFmdGVyIGEKPiBnZW5lcmF0aW9uIHJvbGxvdmVyLgo+Cj4gUmVwcmVz
ZW50IGEgc29mdHdhcmUgVk1JRCBhcyBhIDY0LWJpdCB2YWx1ZSBjb21iaW5pbmcgYSBnZW5lcmF0
aW9uCj4gd2l0aCBhIGhhcmR3YXJlIFZNSUQsIGluZGVwZW5kZW50IG9mIFhMRU4uIFRoaXMga2Vl
cHMgdGhlIGdlbmVyYXRpb24KPiBzcGFjZSBsYXJnZSBvbiBSVjMyIHdoaWxlIGhhcmR3YXJlIFZN
SURzIGFuZCBiaXRtYXAgaW5kaWNlcyByZW1haW4KPiBuYXRpdmUgdW5zaWduZWQgbG9uZyB2YWx1
ZXMuIEV4dHJhY3Qgb25seSB0aGUgaGFyZHdhcmUgVk1JRCB3aGVuCj4gcHJvZ3JhbW1pbmcgSEdB
VFAgb3IgaXNzdWluZyBWTUlELXNwZWNpZmljIGZlbmNlcy4KPgo+IFJlc2VydmUgc29mdHdhcmUg
Vk1JRCAwIGFzIHRoZSB1bmFsbG9jYXRlZCBpZGVudGlmaWVyLiBXaGVuIHRoZQo+IGdlbmVyYXRp
b24gY291bnRlciB3cmFwcyB0byAwLCBjb21wdXRlIHRoZSBuZXh0IG5vbnplcm8gZ2VuZXJhdGlv
bgo+IGxvY2FsbHkgYW5kIHB1Ymxpc2ggaXQgYXRvbWljYWxseSwgc28gZ2VuZXJhdGlvbiAwIGlz
IG5ldmVyIHZpc2libGUgdG8KPiBsb2NrbGVzcyByZWFkZXJzLgo+Cj4gUmVzZXJ2ZSBoYXJkd2Fy
ZSBWTUlEIDAuIERpc2FibGUgVk1JRCBhbGxvY2F0aW9uIHdoZW4gdGhlIGhhcmR3YXJlCj4gVk1J
RCBzcGFjZSBpcyB0b28gc21hbGwgdG8gcmV0YWluIG9uZSByZXNlcnZlZCBWTUlEIHBlciBwb3Nz
aWJsZSBDUFUKPiB3aGlsZSBzdGlsbCBsZWF2aW5nIGEgVk1JRCBhdmFpbGFibGUgZm9yIGEgbmV3
IGFsbG9jYXRpb24uCj4KPiBJbnZhbGlkYXRlIHRoZSBwZXItQ1BVIFZNSUQgYm9va2tlZXBpbmcg
d2hlbiB2aXJ0dWFsaXphdGlvbiBpcwo+IGRpc2FibGVkLCBzbyBzdGFsZSBHLXN0YWdlIHRyYW5z
bGF0aW9ucyBhcmUgZmx1c2hlZCBiZWZvcmUgdGhlIENQVQo+IG5leHQgZW50ZXJzIGEgZ3Vlc3Qu
Cj4KPiBUaGlzIHJlbW92ZXMgSVBJcyBhbmQgcmVtb3RlIENQVSBzeW5jaHJvbml6YXRpb24gZnJv
bSB0aGUgVk1JRAo+IHJvbGxvdmVyIHBhdGgsIGF2b2lkaW5nIFZNIGV4aXRzIGNhdXNlZCBzb2xl
bHkgYnkgVk1JRCBleGhhdXN0aW9uIG9uCj4gYW5vdGhlciBDUFUuCj4KPiBUZXN0ZWQgb24gUUVN
VSB3aXRoIHR3byBob3N0IENQVXMgYW5kIHRoZSBWTUlEIHdpZHRoIHRlbXBvcmFyaWx5Cj4gZm9y
Y2VkIHRvIDIgYml0cy4gUmVwZWF0ZWQgcm9sbG92ZXIsIHByb3RlY3Rpb24gYWdhaW5zdCBwcmVt
YXR1cmUgVk1JRAo+IHJldXNlLCBhY3RpdmF0aW9uLXZlcnN1cy1yb2xsb3ZlciBzdHJlc3MsIGFu
ZCB2Q1BVIG1pZ3JhdGlvbiB3ZXJlCj4gZXhlcmNpc2VkIHdpdGggbXVsdGlwbGUgY29uY3VycmVu
dCBndWVzdHMgd2l0aG91dCBndWVzdCBmYWlsdXJlcyBvcgo+IGhvc3Qgd2FybmluZ3MuCgpOQUNL
LgoKVGhlIHN5bmNocm9ub3VzIElQSSBvbiBWTUlEIHJvbGwtb3ZlciBpcyByZXF1aXJlZCBmb3Ig
Y29ycmVjdG5lc3Mgc28KdGhhdCBhbGwgcnVubmluZyBHdWVzdHMvVk1zIGltbWVkaWF0bHkgdXBk
YXRlIHRoZWlyIFZNSUQuCgpSZWdhcmRzLApBbnVwCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
