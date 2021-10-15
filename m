Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD3B0C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 12:15:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A7F761056
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 12:15:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6A7F761056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=jrtc27.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n82LoOW5lBbwS7I1A3som+7O/YQHrUqx6zzOi0wlA60=; b=zcHH9JpaT75BT5
	nyG6YRO23Qduh58avthqFMTWZiqZb+RF/abtjrKMfedxnvPLHIQOWuXOLRydcJUhlR+JRkXyeUn7G
	1HF4+f5TbhSxVhwZGTOI47LNoVdWCey1gDadckQizxZGs9Dl4XAmv9c4G0gPmAqfcIFuHDipMMUlB
	VXaL8bLuKrmRXvgevZMq3kkRes1op+Gj/BpZEKwTX7CsLRBjgtz3ArLNZPsdL04L6PeajywWcoeme
	/vUadzY+OUAVmzYpmnyzrPO1GdYHJWAer4yf48YJNzANG+HMPP6b0IEwCPYNLx/bKR3+Aj8pU62tc
	gmMhnx3zmEaxxlto9ToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbM7b-006qtN-Vc; Fri, 15 Oct 2021 12:15:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbM7Z-006qro-4q
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 12:15:34 +0000
Received: by mail-wr1-x42d.google.com with SMTP id r7so26181510wrc.10
 for <linux-riscv@lists.infradead.org>; Fri, 15 Oct 2021 05:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jrtc27.com; s=gmail.jrtc27.user;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zKcwx74z267YiFyp+7xDuwStWFpphD6WuubHKqDXSdQ=;
 b=kI8eiKsi6/LtLnq2lIvLR45KjHmFav19vk/2r4iqPwB8TI7rQHv44w2lXSUDspeawr
 vGMdfByLZ8FLMiv+gVpwglM73kuHMf4lsqq4TssgXcbL8EuCH3Eq0y97gL1bw4rl4uAs
 tafgFikBXmsV+kooDcifNvUCvqwElIoRbXTZ9m4quR0ovDcGaCL/59UdO14yojiaGuRd
 wvnVt0mE2190BtSOAY+VCucWgy0wIEfZzfuHEa7h7RKSOjnG+zULCnk+YaN4pc9ckshR
 IryiUYIanU2qHUuVuPWnm+z+p5T+kzgeDr3Ji7EJq8T4wx+zN8gcNykT9morM9fmpAw0
 Tkfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zKcwx74z267YiFyp+7xDuwStWFpphD6WuubHKqDXSdQ=;
 b=m8QCknm25usGUk2r9iVS8ZLGFvl7IafU1rRuN9B6phW4DLUkCmGPUFpKb8NR4Zn+rP
 GIZPa3KioMNlcFK9lKHn7SF+ZT0XOBalctKexM+83+fFeMyKJBhpt1VCUBP2onOmfVu8
 U/KVDQPrWhw7R52bMlmUW/5S+ql1ziZqj70zSoL+j7XKB0IewNbeOI6gNHfpO80/VI70
 N6rBCmVLtPtAb1B3xn8A+3zxNm2ytrQXwXI/kD+OodgPWTxj860PsyJkKjf+lNMZiSTP
 It+D44J2uEGISmwVY+1jCWU7uMsRzl2YeJtNsaQ9gGokAnWOrcWOLn3JucM7lfcC0bQ0
 bbZQ==
X-Gm-Message-State: AOAM530kRJ/PiU1Zu5PJcsDCdATWEDKEzskoqFr+1qlVCPFt4sK7EFND
 I+Ktw2fXLBf0qCJT+ux1XAA8SA==
X-Google-Smtp-Source: ABdhPJwU1QWokaYMAqr3wNsIOAH38qWZ0WWT0A2QjEjHMg3zDHEJH6iyDA3nyB+cONMICiT7ppEalg==
X-Received: by 2002:adf:fa8b:: with SMTP id h11mr14310511wrr.74.1634300130142; 
 Fri, 15 Oct 2021 05:15:30 -0700 (PDT)
Received: from smtpclient.apple (global-5-141.nat-2.net.cam.ac.uk.
 [131.111.5.141])
 by smtp.gmail.com with ESMTPSA id l17sm4739706wrx.24.2021.10.15.05.15.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 15 Oct 2021 05:15:29 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/1] dt-bindings: reg-io-width for SiFive CLINT
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <49af3dc8-0d1e-e82f-6df2-2bf8338acd3a@canonical.com>
Date: Fri, 15 Oct 2021 13:15:28 +0100
Cc: Bin Meng <bmeng.cn@gmail.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Guo Ren <guoren@linux.alibaba.com>,
 Xiang W <wxjstz@126.com>, Samuel Holland <samuel@sholland.org>,
 Atish Patra <atish.patra@wdc.com>, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 devicetree <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 OpenSBI <opensbi@lists.infradead.org>
Message-Id: <D976B0F9-6AE4-4C04-8D52-75B24D6E4359@jrtc27.com>
References: <20211015100941.17621-1-heinrich.schuchardt@canonical.com>
 <CAEUhbmUSmi9mbiHpatBjGgRjrtyJPms9BRmyBPs5BWeVb7n1Nw@mail.gmail.com>
 <49af3dc8-0d1e-e82f-6df2-2bf8338acd3a@canonical.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_051533_220239_A2B708CD 
X-CRM114-Status: GOOD (  15.06  )
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

T24gMTUgT2N0IDIwMjEsIGF0IDEyOjU0LCBIZWlucmljaCBTY2h1Y2hhcmR0IDxoZWlucmljaC5z
Y2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3RlOgo+IAo+IE9uIDEwLzE1LzIxIDEyOjE0LCBC
aW4gTWVuZyB3cm90ZToKPj4gT24gRnJpLCBPY3QgMTUsIDIwMjEgYXQgNjowOSBQTSBIZWlucmlj
aCBTY2h1Y2hhcmR0Cj4+IDxoZWlucmljaC5zY2h1Y2hhcmR0QGNhbm9uaWNhbC5jb20+IHdyb3Rl
Ogo+Pj4gCj4+PiBUaGUgQ0xJTlQgaW4gdGhlIFQtSEVBRCA5eHggcHJvY2Vzc29ycyBkbyBub3Qg
c3VwcG9ydCA2NGJpdCBtbWlvIGFjY2VzcyB0bwo+Pj4gdGhlIE1USU1FUiBkZXZpY2UuIFRoZSBj
dXJyZW50IHNjaGVtYSBkb2VzIG5vdCBhbGxvdyB0byBzcGVjaWZ5IHRoaXMuCj4+PiAKPj4+IE9w
ZW5TQkkgY3VycmVudGx5IHVzZXMgYSBwcm9wZXJ0eSAnY2xpbnQsaGFzLW5vLTY0Yml0LW1taW8n
IHRvIGluZGljYXRlIHRoZQo+Pj4gcmVzdHJpY3Rpb24uIFNhbXVhZWwgSG9sbGFuZCBzdWdnZXN0
ZWQgaW4KPj4+IGxpYjogdXRpbHMvdGltZXI6IFVzZSBzdGFuZGFyZCBwcm9wZXJ0eSB0byBzcGVj
aWZ5IDMyLWJpdCBJL08KPj4+IGh0dHBzOi8vZ2l0aHViLmNvbS9zbWFldWwvb3BlbnNiaS9jb21t
aXQvYjk1ZTljZjdjZjkzYjBhZjE2ZmM4OTIwNDM3OGJjNTlmZjMwMDA4ZQo+Pj4gdG8gdXNlICJy
ZWctaW8td2lkdGggPSA8ND47IiBhcyB0aGUgcmVnLWlvLXdpZHRoIHByb3BlcnR5IGlzIGdlbmVy
YWxseSB1c2VkCj4+PiBpbiB0aGUgZGV2aWNldHJlZSBzY2hlbWEgZm9yIHN1Y2ggYSBjb25kaXRp
b24uCj4+PiAKPj4+IEEgcmVsZWFzZSBjYW5kaWRhdGUgb2YgdGhlIEFDTElOVCBzcGVjaWZpY2F0
aW9uIGlzIGF2YWlsYWJsZSBhdAo+Pj4gaHR0cHM6Ly9naXRodWIuY29tL3Jpc2N2L3Jpc2N2LWFj
bGludC9yZWxlYXNlcwo+Pj4gCj4+PiBBZGQgcmVnLWlvLXdpZHRoIGFzIG9wdGlvbmFsIHByb3Bl
cnR5IHRvIHRoZSBTaUZpdmUgQ29yZSBMb2NhbCBJbnRlcnJ1cHRvci4KPj4+IAo+Pj4gU2lnbmVk
LW9mZi1ieTogSGVpbnJpY2ggU2NodWNoYXJkdCA8aGVpbnJpY2guc2NodWNoYXJkdEBjYW5vbmlj
YWwuY29tPgo+Pj4gLS0tCj4+PiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Rp
bWVyL3NpZml2ZSxjbGludC55YW1sIHwgNyArKysrKysrCj4+PiAgMSBmaWxlIGNoYW5nZWQsIDcg
aW5zZXJ0aW9ucygrKQo+Pj4gCj4+PiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4+PiBpbmRleCBhMzU5NTJm
NDg3NDIuLjI2NjAxMmQ4ODdiNSAxMDA2NDQKPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbAo+Pj4gKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4+PiBAQCAt
NDEsNiArNDEsMTMgQEAgcHJvcGVydGllczoKPj4+ICAgIHJlZzoKPj4+ICAgICAgbWF4SXRlbXM6
IDEKPj4+IAo+Pj4gKyAgcmVnLWlvLXdpZHRoOgo+Pj4gKyAgICBkZXNjcmlwdGlvbjogfAo+Pj4g
KyAgICAgIFNvbWUgQ0xJTlQgaW1wbGVtZW50YXRpb25zLCBlLmcuIG9uIHRoZSBULUhFQUQgOXh4
LCBvbmx5IHN1cHBvcnQKPj4+ICsgICAgICAzMmJpdCBhY2Nlc3MgZm9yIE1USU1FUi4KPj4+ICsg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyCj4+PiArICAg
IGNvbnN0OiA0Cj4+IEJ1dCB0aGlzIGlzIG5vdCBhICJzaWZpdmUsY2xpbnQiIGFueXdheS4gU2hv
dWxkIHRoZXJlIGJlIGEgbmV3Cj4+IGR0LWJpbmRpbmdzIGZvciBULUhlYWQgY2xpbnQgdmFyaWFu
dD8KPiAKPiBJIGFzc3VtZSBieSBuZXcgZHQtYmluZGluZ3MgdmFyaWFudCB5b3UgbWVhbjogQWRk
IGEgbmV3IGNvbXBhdGlibGUgc3RyaW5nIGluIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy90aW1lci9zaWZpdmUsY2xpbnQueWFtbC4KPiAKPiBUaGUgdmVuZG9yIERlYmlhbiBpbWFn
ZSB1c2VzOgo+IGNvbXBhdGlibGUgPSAie2FsbHdpbm5lcixzdW4yMGktZDEtY2xpbnQiLCAic2lm
aXZlLGNsaW50MOKAnX07CgpJIGFzc3VtZSBCaW4gbWVhbnMgdG8gc3RvcCBjYWxsaW5nIGl0IGEg
c2lmaXZlLGNsaW50MCBhbmQgaW5zdGVhZCBoYXZlCnNvbWV0aGluZyBsaWtlCgogICAgImFsbHdp
bm5lcixzdW4yMGktZDEtY2xpbnQiLCAidGhlYWQsY2xpbnQwIgoKYXMgaXMgYmVpbmcgZG9uZSBm
b3IgdGhlaXIgbm9uLWNvbmZvcm1pbmcgUExJQy4gSXTigJlzIHdvcnRoIHBvaW50aW5nIG91dAp0
aGF0IHRoZSBzYW1lIGlzIHRydWUgaGVyZTsgdGhlIFNpRml2ZSBDTElOVCBzdXBwb3J0cyA2NC1i
aXQgYWNjZXNzZXMKb24gUlY2NCwgc28gdGhpcyBpcyBub3QgY29tcGF0aWJsZSB3aXRoIGEgU2lG
aXZlIENMSU5ULiBNb3Jlb3ZlciwgdGhlClJJU0MtViBzcGVjIHdhcyBjbGVhcmx5IHdyaXR0ZW4g
aW4gYSB3YXkgdGhhdCBpbnRlbmRlZCA2NC1iaXQgYWNjZXNzZXMKdG8gYmUgc3VwcG9ydGVkIGZv
ciBSVjY0LCB0aG91Z2ggd2FzIG5vdCBjb21wbGV0ZWx5IGV4cGxpY2l0IGFib3V0CnRoYXQsIHdo
aWNoIGhhcyBub3cgYmVlbiByZXNvbHZlZCAoc2VlCmh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi9y
aXNjdi1pc2EtbWFudWFsL2lzc3Vlcy82MzkpLCBzbyB0aGlzIENMSU5UCnZpb2xhdGVzIHRoZSBv
YnZpb3VzIGludGVudCBvZiB0aGUgcHJlLTEuMTIgcHJpdmlsZWdlZCBzcGVjcyAoc2VlCkFuZHJl
d+KAmXMgbWVzc2FnZSBpbiB0aGUgaXNzdWUsIHdoaWNoIGFncmVlcyB3aXRoIG15IHJlYWRpbmcp
LgoKSmVzcwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
