Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BF80CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 06:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KrDJ+LsAGCp4evvf2epRaRXitLRLT2i4/pPDrEXQ+UM=; b=1XZC3PHKkPgtFj
	L3ynlOi+IWEqmTrrzBnX+/EAcXEkwxyLZumq7IyETaQrfZTMFioNLENUTnqA6VLdxr2xiL9RNs4pn
	nVaPmOywliQpIldlLu6e+ya/K+LOLFDPteGBST/re9GZr3hm58RfUG84qbNgZNakm/JLBCr0IfgNg
	uIOtWT09zqtwoNZXPvb43bgcR15hlbCkKcFoW5hFFwOoLPISoeZ61Kav4+ymVAnp9sGtBnonH3Fr8
	Ck7pmM6Wd6BVu1QKdwxyBi+1fi/4D7yaGZ22WwlUJ63hfvsvRTXrTsMgWtMg35tQzfCBlyGNG5TU9
	AnlnKnwsoZ43u3hOeOyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCX3y-0000000AkEs-0yLu;
	Fri, 02 Oct 2026 06:48:10 +0000
Received: from mail-wr2-x13.google.com ([2a00:1450:4864:30::13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCX3r-0000000AkDl-3Erh
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 06:48:08 +0000
Received: by mail-wr2-x13.google.com with SMTP id ffacd0b85a97d-482f6350f89so4389533f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Oct 2026 23:48:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790923682; cv=none;
        d=google.com; s=arc-20260327;
        b=j9uVJmXKVwDTaddBAKOzVDsO7h7Y35ozxvCcyOZHYf2UKD772inWT4MBL8boFfqE2W
         JDxpPxHFtMD1VjEQYN61oG2A7eb6m37bVtGc5Xy73TZWVnf6sJombWwQlvPuXbtPcXVr
         L74HaodhfpRTnCV4slOWLdqY8VnGMiqFM7CPJMc151XRJUEnp0pZdGN5EGnq3oVyZRZZ
         0pFLbrNLqMjJGLCsBOePM8LyRg/Do7VP4KbmRO9rcOdTVaznR9rZvIDb0zU0l00UX8v7
         6VAgjdWKzYog17Wa4XPUgKZXBoJHfk3KOkfxGgwwqvfggA/RY5HdbupyP+vke0ARduOg
         RNiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vMIvcSqpnAcev0LvZqzsQlju0HUUMmzyz0rX4omO44Q=;
        fh=KQnnm9XtujL+QHlRhqKT5gW7lBhFBU9FtC0lLBH54Oc=;
        b=BeCOpA48uHgExJ41M+5Ssne6gD50aLhPWIIjTTzAsjFqzpTncRo5c8sRDty6bUyfy/
         YsLI+r1EWVGgBs1+LeSrJizGqGFW8eVNMbss5rIIg2JsaX5vpi650kB7sJ3WgnY0IJ0D
         xJ+yvjcACRALO8CWhi4gie9UfGeITGJbHa5JHUWU8aOZVzlhyjdOzccH65noudW2BKmX
         hh+R0qCEIo/BPftAoMUnMJiApc/uY7Ygpx3AoWTGqT9wk9pW7w62yM7DlzBPB2Rm4yK9
         32GBiLBP9rpugKn8wKU4yPano8FShUdHNBKLXKM6/HIlJ8s1x5EzNxg9G3zWy6QvtfMf
         uwvg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1790923682; x=1791528482; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vMIvcSqpnAcev0LvZqzsQlju0HUUMmzyz0rX4omO44Q=;
        b=SGPJ3lTn4j4J83JSFKx8BNQC5RENiuTAJFPLslPpuiH5iaACtOLRXa8/H/BmoDNv5p
         ZNwofIL3592U/LOZBIvQw3dE0lExp+cTGyOnC82ssEjeFhre8IdxnZZDU0keYvp1E+zQ
         IqkrwA5B3p2ewIGIXCtkMLM9Eqlryw7X0DVHkA5AeHHua6cl7yWcEEcPkkCfQAOtb5nW
         ohHELDIegES1v/HBODW8fyg5KDSYTAu1WZIp5gDk1D4s5zn1SdBkz+jrMtNxKA6DwOGp
         jBS2EcqRQzfahxbGYiKsF6+gMtZCV4MaoFiv+oi/ve7+5/Ja+d0X2HID5qpPTlbT9ONx
         nt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790923682; x=1791528482;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vMIvcSqpnAcev0LvZqzsQlju0HUUMmzyz0rX4omO44Q=;
        b=boQs705eePChm5Go30RN7hOO9EFBkcYqHeA78z/r7TZsKq7CDIN2EL6TcXG0O7N3Cu
         FriVq1qT/BoRd7sYwyN8dfhjFP3a+aIXkYK4ZKwlHToTuQmSCg2njIOeXX/7VJZwQVGo
         mRXlQ6uHs3I61lbiRgijqec0zxa75y+DW1JBuqTPU0vNJ9hoZduD2NocEsFyEkWVnQxd
         iOZIG0BWaB7hmWmakVu5A0UvA51tV+JsV5PmCqaEWx/Ur1B3CTVu5jkOvHCCmslpqpqi
         +zVGNDnr5KKRSBIVDlfnf0cs5ezR4UHn9Sj0pcGVc9UyhmDELoU94j6hgU6djqQxv7lG
         pyEw==
X-Forwarded-Encrypted: i=1; AKwUvBxgKBLfkg6whRXsCYPG6uw9Ufua/rnsGpamkbkt1sdi0EWQWyE283+eamrnUsP7OEF1DJN/yjzk03AEcg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLLxn4I3LDywnX/I3+6OBWx3xcJ9x6iROBT7GGKHXmMhvgQBeLZ
	ckOQqUvW4c2QpIeTKe2H6SRctVAd8DARphnbAZ+cUZs3TVl+9u4kCCeRbY5czpXyYhYOlCRHrfA
	fkSPUcdK2Z/wu11y3Qtx+N7qmdeecpp58T9q4hxFGbGw1LlcVyeam2tI=
X-Gm-Gg: AYBFou2to6KKl+w4br+y01YhStywKV95chMhpy3Fx4Hh9OSPCGM62sHXCBXHGR/rLSz
	zRHjHmQ5i0sHF1PPtSouxdbdDxse4LSXItxC2YHPgpvzuATDUgEqrYFvi0D3Nq75vK1bqkqLnkQ
	PMoWge+k/OBfB9nMYqsGzAKHlIj22fd9A6E3eb2Jy/ULQ+Ch/gJt0fXrSz4AM7gRbJUmbWogMYX
	LoLnZW+IhzwbQXY8i7Y39FKymtkhDc2BnwGfnqbgoNqASSyDWcMzdnYREcdJBsY5L8DA3ZvP/T/
	AM0M9cZ1hGtBsG17a/gPtXZTOM7o0nJaDZcsR5xP9vtugrOpvY8sMO5RixkErqGX7K+l3MAstSj
	G9ca7+8zDhAuoBZi9wBe+ywM3EeIHR+VF7iDBIXvq0cSt6ENYsPMnD6SnoNx8n+u+umI9DTDcOk
	Mh
X-Received: by 2002:a5d:64c9:0:b0:487:91e:d8ed with SMTP id
 ffacd0b85a97d-48b12702290mr3229174f8f.2.1790923681806; Thu, 01 Oct 2026
 23:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260721024236.14761-1-xb@ultrarisc.com>
In-Reply-To: <20260721024236.14761-1-xb@ultrarisc.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 2 Oct 2026 12:17:49 +0530
X-Gm-Features: AclHuK9UOCVZ6vodJjvCC76-FwtaW02UpOlI0apEZivkAZ5yfpYjH_mX6sQE75Y
Message-ID: <CAAhSdy0fqbBTfzab1H96a5B469mzuMmi4c54opPXw1-+z8_Pvw@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Add SBI DBTR extension forwarding
To: Xie Bo <xb@ultrarisc.com>
Cc: Atish Patra <atish.patra@linux.dev>, kvm-riscv@lists.infradead.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_234803_861075_53DCA435 
X-CRM114-Status: GOOD (  18.73  )
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

T24gVHVlLCBKdWwgMjEsIDIwMjYgYXQgODoxMuKAr0FNIFhpZSBCbyA8eGJAdWx0cmFyaXNjLmNv
bT4gd3JvdGU6Cj4KPiBUaGUgU0JJIGhlYWRlcnMgZGVmaW5lIHRoZSBEZWJ1ZyBUcmlnZ2VycyBl
eHRlbnNpb24gYW5kIGl0cyBmdW5jdGlvbiBJRHMsCj4gYnV0IEtWTSBkb2VzIG5vdCBjdXJyZW50
bHkgYWxsb3cgYSBWTU0gdG8gZXhwb3NlIERCVFIgdG8gYSBndWVzdC4KPgo+IEFkZCBEQlRSIHRv
IHRoZSBLVk0gU0JJIGV4dGVuc2lvbiBsaXN0IGFuZCBmb3J3YXJkIGl0cyBjYWxscyB0byB1c2Vy
c3BhY2UKPiB0aHJvdWdoIHRoZSBleGlzdGluZyBLVk1fRVhJVF9SSVNDVl9TQkkgcGF0aC4gS2Vl
cCB0aGUgZXh0ZW5zaW9uIGRpc2FibGVkCj4gYnkgZGVmYXVsdCBzbyB0aGF0IHVzZXJzcGFjZSBt
dXN0IGV4cGxpY2l0bHkgZW5hYmxlIGl0IHRocm91Z2ggdGhlIFNCSQo+IGV4dGVuc2lvbiBPTkVf
UkVHIGludGVyZmFjZSBiZWZvcmUgcnVubmluZyB0aGUgVkNQVS4KCkJsaW5kbHkgZm9yd2FyZGlu
ZyBTQkkgREJUUiBjYWxscyB0byBLVk0gdXNlci1zcGFjZSB3aWxsIG5vdCB3b3JrIGJlY2F1c2UK
KGp1c3QgbGlrZSBTQkkgUE1VKSB3ZSB3aWxsIGJlIHNoYXJpbmcgSFcgZGVidWcgdHJpZ2dlcnMg
YmV0d2VlbiBob3N0IGFuZApndWVzdCB3aGVyZSBLVk0gUklTQy1WIHdpbGwgaGF2ZSBhIHNlcGFy
YXRlIHBhdGggdGhyb3VnaCB0aGUgcGVyZiBzdWJzeXN0ZW0KdG8gY29uZmlndXJlIGRlYnVnIHRy
aWdnZXJzIGZvciBndWVzdHMuCgpXZSAoUXVhbGNvbW0pIGFyZSBhbHJlYWR5IHdvcmtpbmcgb24g
YSBzZXJpZXMgZm9yIFNCSSBEQlRSIHZpcnR1YWxpemF0aW9uCmluIEtWTSBSSVNDLVYgc28gc3Rh
eSB0dW5lZC4KClJlZ2FyZHMsCkFudXAKCj4KPiBTaWduZWQtb2ZmLWJ5OiBYaWUgQm8gPHhiQHVs
dHJhcmlzYy5jb20+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVfc2Jp
LmggfCAxICsKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2t2bS5oICAgICB8IDEgKwo+
ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jICAgICAgICAgICAgIHwgNCArKysrCj4gIGFyY2gv
cmlzY3Yva3ZtL3ZjcHVfc2JpX2ZvcndhcmQuYyAgICAgfCA3ICsrKysrKysKPiAgNCBmaWxlcyBj
aGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9rdm1fdmNwdV9zYmkuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20va3ZtX3ZjcHVf
c2JpLmgKPiBpbmRleCBjMWE3ZTNiNDAuLjUzNDA2YjAyZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2t2bV92Y3B1X3NiaS5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9rdm1fdmNwdV9zYmkuaAo+IEBAIC0xMDQsNiArMTA0LDcgQEAgZXh0ZXJuIGNvbnN0IHN0
cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9yZmVuY2U7Cj4gIGV4dGVy
biBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfc3JzdDsK
PiAgZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4
dF9oc207Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3ZtX3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1
X3NiaV9leHRfZGJjbjsKPiArZXh0ZXJuIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5z
aW9uIHZjcHVfc2JpX2V4dF9kYnRyOwo+ICBleHRlcm4gY29uc3Qgc3RydWN0IGt2bV92Y3B1X3Ni
aV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X3N1c3A7Cj4gIGV4dGVybiBjb25zdCBzdHJ1Y3Qga3Zt
X3ZjcHVfc2JpX2V4dGVuc2lvbiB2Y3B1X3NiaV9leHRfc3RhOwo+ICBleHRlcm4gY29uc3Qgc3Ry
dWN0IGt2bV92Y3B1X3NiaV9leHRlbnNpb24gdmNwdV9zYmlfZXh0X2Z3ZnQ7Cj4gZGlmZiAtLWdp
dCBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaCBiL2FyY2gvcmlzY3YvaW5jbHVk
ZS91YXBpL2FzbS9rdm0uaAo+IGluZGV4IDUwNGU3MzMwNS4uMDQ3ZDgyZjA1IDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3YvaW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS91YXBpL2FzbS9rdm0uaAo+IEBAIC0yMjEsNiArMjIxLDcgQEAgZW51bSBLVk1fUklT
Q1ZfU0JJX0VYVF9JRCB7Cj4gICAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9TVVNQLAo+ICAgICAg
ICAgS1ZNX1JJU0NWX1NCSV9FWFRfRldGVCwKPiAgICAgICAgIEtWTV9SSVNDVl9TQklfRVhUX01Q
WFksCj4gKyAgICAgICBLVk1fUklTQ1ZfU0JJX0VYVF9EQlRSLAo+ICAgICAgICAgS1ZNX1JJU0NW
X1NCSV9FWFRfTUFYLAo+ICB9Owo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVf
c2JpLmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X3NiaS5jCj4gaW5kZXggNDZhYjdiOTg5Li5lZDIx
MjM5YzUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmkuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpLmMKPiBAQCAtNzAsNiArNzAsMTAgQEAgc3RhdGljIGNvbnN0
IHN0cnVjdCBrdm1fcmlzY3Zfc2JpX2V4dGVuc2lvbl9lbnRyeSBzYmlfZXh0W10gPSB7Cj4gICAg
ICAgICAgICAgICAgIC5leHRfaWR4ID0gS1ZNX1JJU0NWX1NCSV9FWFRfREJDTiwKPiAgICAgICAg
ICAgICAgICAgLmV4dF9wdHIgPSAmdmNwdV9zYmlfZXh0X2RiY24sCj4gICAgICAgICB9LAo+ICsg
ICAgICAgewo+ICsgICAgICAgICAgICAgICAuZXh0X2lkeCA9IEtWTV9SSVNDVl9TQklfRVhUX0RC
VFIsCj4gKyAgICAgICAgICAgICAgIC5leHRfcHRyID0gJnZjcHVfc2JpX2V4dF9kYnRyLAo+ICsg
ICAgICAgfSwKPiAgICAgICAgIHsKPiAgICAgICAgICAgICAgICAgLmV4dF9pZHggPSBLVk1fUklT
Q1ZfU0JJX0VYVF9TVVNQLAo+ICAgICAgICAgICAgICAgICAuZXh0X3B0ciA9ICZ2Y3B1X3NiaV9l
eHRfc3VzcCwKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZm9yd2FyZC5j
IGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZm9yd2FyZC5jCj4gaW5kZXggNWEzYzc1ZWIyLi44
YWMzMWI1M2YgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZm9yd2FyZC5j
Cj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZm9yd2FyZC5jCj4gQEAgLTI2LDYgKzI2
LDEzIEBAIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9k
YmNuID0gewo+ICAgICAgICAgLmhhbmRsZXIgPSBrdm1fcmlzY3ZfdmNwdV9zYmlfZm9yd2FyZF9o
YW5kbGVyLAo+ICB9Owo+Cj4gK2NvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlfZXh0ZW5zaW9uIHZj
cHVfc2JpX2V4dF9kYnRyID0gewo+ICsgICAgICAgLmV4dGlkX3N0YXJ0ID0gU0JJX0VYVF9EQlRS
LAo+ICsgICAgICAgLmV4dGlkX2VuZCA9IFNCSV9FWFRfREJUUiwKPiArICAgICAgIC5kZWZhdWx0
X2Rpc2FibGVkID0gdHJ1ZSwKPiArICAgICAgIC5oYW5kbGVyID0ga3ZtX3Jpc2N2X3ZjcHVfc2Jp
X2ZvcndhcmRfaGFuZGxlciwKPiArfTsKPiArCj4gIGNvbnN0IHN0cnVjdCBrdm1fdmNwdV9zYmlf
ZXh0ZW5zaW9uIHZjcHVfc2JpX2V4dF9tcHh5ID0gewo+ICAgICAgICAgLmV4dGlkX3N0YXJ0ID0g
U0JJX0VYVF9NUFhZLAo+ICAgICAgICAgLmV4dGlkX2VuZCA9IFNCSV9FWFRfTVBYWSwKPgo+IGJh
c2UtY29tbWl0OiBiOTVmMDNmMDRkNDc1YWE2NzE5ZDE1YTYzNmRkZjMyMjIyZDU1NjU3Cj4gLS0K
PiAyLjU0LjAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
