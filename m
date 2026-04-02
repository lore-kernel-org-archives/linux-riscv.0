Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A5FD39434
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 14:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j6WbKt27J3lRuP7ParmVv6+mun7ld7xq0QEfMKTLyR0=; b=PYn1o9+32uKK76
	KaGmicv/Zt5uHVLvdjthsRi1HDVR4inqljeeTV89W526dD+OlBC0r17ypIvOLUmUaaRdChw6b34OE
	BvSWX2iKEdOFrdYUgbQgdTyltfEDmM584Ci7SgToZjAGoaJukRaUeIbfsC+Q53YK22j5bIFz0nVOh
	TMCtWuUUFwbtVHFzS/Hrjv1lzI/XNU3Zh0Q5lbNJCIXj15U/wRuzC3cyrrtNe0ZGXg19HlN1bHwCa
	OveKrfDiJfzh4A1uOlgUMNAd0IcV4YORnnSekZ+7fHumJj6If/uWA1UEtXTfqo5d2/FZre7Ka/wll
	Eac2zCItBIN8aVqZgNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JDr-00000000Mca-359R;
	Thu, 02 Apr 2026 14:40:39 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8JDo-00000000MbP-1v09
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 14:40:38 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-67e23011c93so348138eaf.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 07:40:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775140835; cv=none;
        d=google.com; s=arc-20240605;
        b=QxPygnnZxzU711X1dGgChd02cm76ZZ4evIZT8dssjlKvoW1ez1esspFbKMBgXOrs69
         F+6VRaeSBWX0w654jSCj7ibWbaTGR0+mUoxDuBsxDjfmhGCCKr499tI5BNdfTaPygChL
         qpoLoLwn9fwXM2MVbnBUzUusNXBNMaiX4j0fF+z+kivH1lGYDzbWlSt7pbjPKlAAV6H0
         mw8ugnz/opLhmCEjxCq/mh37tFGDZqVs5A22vxYE+h1xM83TPBI5aFfgr9kLQZLmiYt2
         mJzNp6u38TZxJvqjx6vRilYW/GwjVPr+btKSxYZavsVJFKKxb/G1BNkxeSXs1jY3zOWA
         RRWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CgXVgNr9LcoHCMvR/4QMuJnwtL2EPpKXdJ8rG5+UP24=;
        fh=F6IHguSEbs7CzbDmeIsMlJR20FnzCy0Zg5EpTxHQunw=;
        b=jHHFD0Ryg8z0+L+0a4hRnAIyrJ+zy670VS4diU2C92bcmB412pqpfdO0w0vvgzNKxL
         AHzxrx0XK6Hz2w7pOEwXCcxMNKj8pMZqYrkrOBcdYGvOM5/JBKC34mjgYMS/Ox/vaPfA
         dQUmjTkGtkZj6mv8uwBdRKdFf7PNa5SbkB9h/sq65BFGFeJ58jjY3V8qwpAB3ixzZ7OW
         lKOpvHZYj2L1akFN03hb211WgxGJ/o9YUcDg5/yYZ10imRNOIF6KMy+8J4psgvOE/D58
         TkG6CfGPM7Red/RNv7TlDgsN5KwFl+oZKzb1NlVN0d8+CmoRiIQPi+s2YXBxRpYMkXUM
         hQ6A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1775140835; x=1775745635; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CgXVgNr9LcoHCMvR/4QMuJnwtL2EPpKXdJ8rG5+UP24=;
        b=P+JXMoj32E8c0bZMj7bun6rXV5wXErZ2WengQYL540up0fKqljwta1bn8aS7viukdr
         pIoVUFBO5Sl+e/kyrwpY7/89cXQlEdgxX5RvIn1PG01zfpkHt63Tvg2eKueSzBrHWAUc
         SZmj5O5F2MMkMRWvsyLLpptL3wp3zyybni/p91Z8AvYB0fWuIbl0AtO7fW8IH+vQnsiB
         s6YGGxLFFCr5Lyb/GKAJBENjTl+qosOy074qaJYIWTtnXvi1J2dwYqclmyc9MR/SFq/x
         XfSHhUU8e7XTEm452PkBImv1lgjoT2xahtCs1brQV+OfznKDT10SDIQtYm9EmfKJ2Cn8
         6SJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775140835; x=1775745635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CgXVgNr9LcoHCMvR/4QMuJnwtL2EPpKXdJ8rG5+UP24=;
        b=aHCb7wxo3mpgfCdXxb/vVpVM1OyhLMMxz/SChQjys0YEThasCXnurbbSX2Ahl0vJRM
         uHdFSXbuFdCxbbMElqcEb5b5JeIKp7kTOakMC7zUAtlwrRIqnhk9KQctSGJLuGDM5FIU
         G8WbU+Czz5WBJgB+n47sZCVjpAA7v9cgw1tsA+IEMVXf+BE5XorcMjPOhR3R0Jdd+DZk
         e1bMOLUstWfMOlmGmizCajUYheQ5SHEXvKt6d2ngAzsYC5aboHvzTXMnHVg4+S7+QSWO
         z2fWO78YaW133FMApuRvj5dIYmwJv5zleUjzZXkkd7uxmAYqDOgE69yNKTwZBs9stDLR
         095w==
X-Forwarded-Encrypted: i=1; AJvYcCWcq+koqnUnq2o1ZeVZNiF/09orEONykmH4sEq7CvubErCjgF9ad2hzx089Ha59YcWI2ik0YacG0hPj4A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF94SG6I54/pU6LA3ivLjnbeAuRmHadmC9pqzoWbS+1c9cq5YP
	D+ickWe9fqdCvWjdOXLa5NSI+NbmIuAED/jDw+slW81SZC2juSYyWlpv49kChxIa3KnLAFFwk6l
	3ZV9XEh10dQ6+iem8eHfEUrJ/uqQ52bYEGT2cnPnx4A==
X-Gm-Gg: ATEYQzybNEBfTCYc/YEtqC9X+ZVpoZuMaorZLpZC4MLAjEBb4a8M6cnKdNE+Butko6o
	kYenZyf+8EwRtt0fQ0f0/XGJxCFKH1W9wTN+DvcLthESSZYuKvNq/MDEr5xOIg+Lc3Qi/xHnUNb
	ce+EMjRXl1Guv1ARajhVih/9lsIhBWOT0u57pZ6G/2cox/ZTXn6J00K9PL390adV5Co0RsgeX7E
	PaPg4pzmfJEPrFWKv42eEMqhNcmdDc6zdsxqQoiNeEYauD5gviRJAgqSnmxyyHZhODm2ew5RpDs
	GhWQ2KShUfYG78VoshTtQ308KAKup1FhKgibpfM3S6F/6+xTpRKbrYZrbxmc4NEQ9I1Eo79m2lx
	xJqhSjfnNqDvWP0erF55tR+mTSw==
X-Received: by 2002:a05:6820:828:b0:67e:244a:7dd5 with SMTP id
 006d021491bc7-67fabcd8e2dmr3743192eaf.51.1775140835100; Thu, 02 Apr 2026
 07:40:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260402132303.6252-1-fangyu.yu@linux.alibaba.com> <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
In-Reply-To: <20260402132303.6252-4-fangyu.yu@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Apr 2026 20:10:23 +0530
X-Gm-Features: AQROBzDhVdJ-Rk6tIUeOmOBsDek_WXlm04aASx05OVR5rTbB0T6p0wGRWJFy36Q
Message-ID: <CAAhSdy3fVrw+=TgtgttQwnjUBy2s4OdhNcKZ+wK8pJFDi+Y89A@mail.gmail.com>
Subject: Re: [PATCH v7 3/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	skhan@linuxfoundation.org, guoren@kernel.org, radim.krcmar@oss.qualcomm.com, 
	andrew.jones@oss.qualcomm.com, linux-doc@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_074036_645504_775F5A8F 
X-CRM114-Status: GOOD (  19.43  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCA2OjUz4oCvUE0gPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4gd3JvdGU6Cj4KPiBGcm9tOiBGYW5neXUgWXUgPGZhbmd5dS55dUBsaW51eC5hbGliYWJh
LmNvbT4KPgo+IEV4dGVuZCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KCkgdG8gcmVjb3Jk
IEhHQVRQLk1PREUgdmFsdWVzIGluIGEKPiBiaXRtYXNrLiBLZWVwIHRyYWNraW5nIHRoZSBtYXhp
bXVtIHN1cHBvcnRlZCBHLXN0YWdlIHBhZ2UgdGFibGUgbGV2ZWwKPiBmb3IgZXhpc3RpbmcgaW50
ZXJuYWwgdXNlcnMuCj4KPiBBbHNvIHByb3ZpZGUgbGlnaHR3ZWlnaHQgaGVscGVycyB0byByZXRy
aWV2ZSB0aGUgc3VwcG9ydGVkLW1vZGUgYml0bWFzawo+IGFuZCB2YWxpZGF0ZSBhIHJlcXVlc3Rl
ZCBIR0FUUC5NT0RFIGFnYWluc3QgaXQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBGYW5neXUgWXUgPGZh
bmd5dS55dUBsaW51eC5hbGliYWJhLmNvbT4KPiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxh
bmRyZXcuam9uZXNAb3NzLnF1YWxjb21tLmNvbT4KPiBSZXZpZXdlZC1ieTogR3VvIFJlbiA8Z3Vv
cmVuQGtlcm5lbC5vcmc+CgpMR1RNLgoKUmV2aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJh
aW5mYXVsdC5vcmc+CgpUaGFua3MsCkFudXAKCj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9h
c20va3ZtX2dzdGFnZS5oIHwgMTEgKysrKysrKysrKysKPiAgYXJjaC9yaXNjdi9rdm0vZ3N0YWdl
LmMgICAgICAgICAgICAgfCAxNSArKysrKysrKysrKystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAy
MyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvaW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9rdm1f
Z3N0YWdlLmgKPiBpbmRleCA3MGQ5ZDQ4MzM2NWUuLmJiZjhmNDVjNjU2MyAxMDA2NDQKPiAtLS0g
YS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2t2bV9nc3RhZ2UuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20va3ZtX2dzdGFnZS5oCj4gQEAgLTMxLDYgKzMxLDcgQEAgc3RydWN0IGt2bV9n
c3RhZ2VfbWFwcGluZyB7Cj4gICNlbmRpZgo+Cj4gIGV4dGVybiB1bnNpZ25lZCBsb25nIGt2bV9y
aXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHM7Cj4gK2V4dGVybiB1MzIga3ZtX3Jpc2N2X2dzdGFn
ZV9zdXBwb3J0ZWRfbW9kZV9tYXNrOwo+Cj4gICNkZWZpbmUga3ZtX3Jpc2N2X2dzdGFnZV9wZ2Rf
eGJpdHMgICAgIDIKPiAgI2RlZmluZSBrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9zaXplICAgICAgKDFV
TCA8PCAoSEdBVFBfUEFHRV9TSElGVCArIGt2bV9yaXNjdl9nc3RhZ2VfcGdkX3hiaXRzKSkKPiBA
QCAtMTAyLDQgKzEwMywxNCBAQCBzdGF0aWMgaW5saW5lIHZvaWQga3ZtX3Jpc2N2X2dzdGFnZV9p
bml0KHN0cnVjdCBrdm1fZ3N0YWdlICpnc3RhZ2UsIHN0cnVjdCBrdm0gKgo+ICAgICAgICAgZ3N0
YWdlLT5wZ2RfbGV2ZWxzID0ga3ZtLT5hcmNoLnBnZF9sZXZlbHM7Cj4gIH0KPgo+ICtzdGF0aWMg
aW5saW5lIHUzMiBrdm1fcmlzY3ZfZ2V0X2hnYXRwX21vZGVfbWFzayh2b2lkKQo+ICt7Cj4gKyAg
ICAgICByZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNrOwo+ICt9Cj4g
Kwo+ICtzdGF0aWMgaW5saW5lIGJvb2wga3ZtX3Jpc2N2X2hnYXRwX21vZGVfaXNfdmFsaWQodW5z
aWduZWQgbG9uZyBtb2RlKQo+ICt7Cj4gKyAgICAgICByZXR1cm4ga3ZtX3Jpc2N2X2dzdGFnZV9z
dXBwb3J0ZWRfbW9kZV9tYXNrICYgQklUKG1vZGUpOwo+ICt9Cj4gKwo+ICAjZW5kaWYKPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMgYi9hcmNoL3Jpc2N2L2t2bS9nc3RhZ2Uu
Ywo+IGluZGV4IDdjNGMzNGJjMTkxYi4uOTIwNGU2NDI3ZDJkIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL2dzdGFnZS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vZ3N0YWdlLmMKPiBAQCAt
MTYsNiArMTYsOCBAQCB1bnNpZ25lZCBsb25nIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZl
bHMgX19yb19hZnRlcl9pbml0ID0gMzsKPiAgI2Vsc2UKPiAgdW5zaWduZWQgbG9uZyBrdm1fcmlz
Y3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzIF9fcm9fYWZ0ZXJfaW5pdCA9IDI7Cj4gICNlbmRpZgo+
ICsvKiBCaXRtYXNrIG9mIHN1cHBvcnRlZCBIR0FUUC5NT0RFIGVuY29kaW5ncyAoQklUKEhHQVRQ
X01PREVfKikpLiAqLwo+ICt1MzIga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNr
IF9fcm9fYWZ0ZXJfaW5pdDsKPgo+ICAjZGVmaW5lIGdzdGFnZV9wdGVfbGVhZihfX3B0ZXApICAg
ICAgICBcCj4gICAgICAgICAocHRlX3ZhbCgqKF9fcHRlcCkpICYgKF9QQUdFX1JFQUQgfCBfUEFH
RV9XUklURSB8IF9QQUdFX0VYRUMpKQo+IEBAIC0zMTcsMTEgKzMxOSwxNyBAQCB2b2lkIGt2bV9y
aXNjdl9nc3RhZ2Vfd3BfcmFuZ2Uoc3RydWN0IGt2bV9nc3RhZ2UgKmdzdGFnZSwgZ3BhX3Qgc3Rh
cnQsIGdwYV90IGVuZAo+Cj4gIHZvaWQgX19pbml0IGt2bV9yaXNjdl9nc3RhZ2VfbW9kZV9kZXRl
Y3Qodm9pZCkKPiAgewo+ICsgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9t
YXNrID0gMDsKPiArICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSAwOwo+
ICsKPiAgI2lmZGVmIENPTkZJR182NEJJVAo+ICAgICAgICAgLyogVHJ5IFN2NTd4NCBHLXN0YWdl
IG1vZGUgKi8KPiAgICAgICAgIGNzcl93cml0ZShDU1JfSEdBVFAsIEhHQVRQX01PREVfU1Y1N1g0
IDw8IEhHQVRQX01PREVfU0hJRlQpOwo+ICAgICAgICAgaWYgKChjc3JfcmVhZChDU1JfSEdBVFAp
ID4+IEhHQVRQX01PREVfU0hJRlQpID09IEhHQVRQX01PREVfU1Y1N1g0KSB7Cj4gICAgICAgICAg
ICAgICAgIGt2bV9yaXNjdl9nc3RhZ2VfbWF4X3BnZF9sZXZlbHMgPSA1Owo+ICsgICAgICAgICAg
ICAgICBrdm1fcmlzY3ZfZ3N0YWdlX3N1cHBvcnRlZF9tb2RlX21hc2sgfD0gQklUKEhHQVRQX01P
REVfU1Y1N1g0KSB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCSVQoSEdBVFBfTU9ERV9TVjQ4WDQpIHwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChIR0FUUF9NT0RFX1NW
MzlYNCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiAgICAgICAgIH0KPgo+IEBAIC0z
MjksNiArMzM3LDggQEAgdm9pZCBfX2luaXQga3ZtX3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2
b2lkKQo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgSEdBVFBfTU9ERV9TVjQ4WDQgPDwg
SEdBVFBfTU9ERV9TSElGVCk7Cj4gICAgICAgICBpZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4g
SEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9ERV9TVjQ4WDQpIHsKPiAgICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscyA9IDQ7Cj4gKyAgICAgICAgICAgICAg
IGt2bV9yaXNjdl9nc3RhZ2Vfc3VwcG9ydGVkX21vZGVfbWFzayB8PSBCSVQoSEdBVFBfTU9ERV9T
VjQ4WDQpIHwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEJJVChIR0FUUF9NT0RFX1NWMzlYNCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8g
ZG9uZTsKPiAgICAgICAgIH0KPgo+IEBAIC0zMzYsNiArMzQ2LDcgQEAgdm9pZCBfX2luaXQga3Zt
X3Jpc2N2X2dzdGFnZV9tb2RlX2RldGVjdCh2b2lkKQo+ICAgICAgICAgY3NyX3dyaXRlKENTUl9I
R0FUUCwgSEdBVFBfTU9ERV9TVjM5WDQgPDwgSEdBVFBfTU9ERV9TSElGVCk7Cj4gICAgICAgICBp
ZiAoKGNzcl9yZWFkKENTUl9IR0FUUCkgPj4gSEdBVFBfTU9ERV9TSElGVCkgPT0gSEdBVFBfTU9E
RV9TVjM5WDQpIHsKPiAgICAgICAgICAgICAgICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xl
dmVscyA9IDM7Cj4gKyAgICAgICAgICAgICAgIGt2bV9yaXNjdl9nc3RhZ2Vfc3VwcG9ydGVkX21v
ZGVfbWFzayB8PSBCSVQoSEdBVFBfTU9ERV9TVjM5WDQpOwo+ICAgICAgICAgICAgICAgICBnb3Rv
IGRvbmU7Cj4gICAgICAgICB9Cj4gICNlbHNlIC8qIENPTkZJR18zMkJJVCAqLwo+IEBAIC0zNDMs
MTMgKzM1NCwxMSBAQCB2b2lkIF9faW5pdCBrdm1fcmlzY3ZfZ3N0YWdlX21vZGVfZGV0ZWN0KHZv
aWQpCj4gICAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHQVRQLCBIR0FUUF9NT0RFX1NWMzJYNCA8PCBI
R0FUUF9NT0RFX1NISUZUKTsKPiAgICAgICAgIGlmICgoY3NyX3JlYWQoQ1NSX0hHQVRQKSA+PiBI
R0FUUF9NT0RFX1NISUZUKSA9PSBIR0FUUF9NT0RFX1NWMzJYNCkgewo+ICAgICAgICAgICAgICAg
ICBrdm1fcmlzY3ZfZ3N0YWdlX21heF9wZ2RfbGV2ZWxzID0gMjsKPiArICAgICAgICAgICAgICAg
a3ZtX3Jpc2N2X2dzdGFnZV9zdXBwb3J0ZWRfbW9kZV9tYXNrIHw9IEJJVChIR0FUUF9NT0RFX1NW
MzJYNCk7Cj4gICAgICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiAgICAgICAgIH0KPiAgI2VuZGlm
Cj4KPiAtICAgICAgIC8qIEtWTSBkZXBlbmRzIG9uICFIR0FUUF9NT0RFX09GRiAqLwo+IC0gICAg
ICAga3ZtX3Jpc2N2X2dzdGFnZV9tYXhfcGdkX2xldmVscyA9IDA7Cj4gLQo+ICBkb25lOgo+ICAg
ICAgICAgY3NyX3dyaXRlKENTUl9IR0FUUCwgMCk7Cj4gICAgICAgICBrdm1fcmlzY3ZfbG9jYWxf
aGZlbmNlX2d2bWFfYWxsKCk7Cj4gLS0KPiAyLjUwLjEKPgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
