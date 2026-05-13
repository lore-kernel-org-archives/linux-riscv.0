Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFECCD4851
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 16:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/PUmCnUTE2b7nFCymRCEHe4QzPVqR2C25DIsXzK7iY=; b=hYus53UedtTC3+
	EpVGxOgkk65Sn0db1eS5OfFPbSvANMd+CE6rFkV7yGjohFSGwRmqP23DgH759ParDWdF+0exm3zlq
	LFRFFs6dWpYyj3jq00t72/t9Os0uQnj62VcYD+jnUUu4VitovbciOgRK3FCTHHseWw4iLv/K9hISU
	MCaEugE9Dt4Ifa+1Nulj/QPTQkd8f5Sd4slFro4GJrYDRMfM5sZmWw94JSPOGYT5oY70egztfq20Y
	4KcymJNN1wloXpsQ0la2+zK+ktIjS+gkJCQCINoVWuj3U9ys5+qWu+StPZV1Y8f7Si3JU4qklCEjv
	Hw3mCrcWPt14ywr/jF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCJv-00000003BuD-1Sqs;
	Wed, 13 May 2026 16:20:27 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNCJs-00000003Btb-1zFS
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 16:20:25 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2ba180a022dso625ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 May 2026 09:20:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778689223; cv=none;
        d=google.com; s=arc-20240605;
        b=gwFHQSpb9WJa8CrK7QSmsFd+zgUTbktLay7qERNPwGZFouziD+NQNB2BYT+V3JkZyg
         MoKR4c6NBMb9/0S8183L4Rwpyzx78/KfpTRwQjjRhODswFzfCOND736XxLcyICtgmiTW
         Tk9ad0qL4UmDi34uE0fEDJX1UIEi3WMSsitiE0Rmlsm23ZUPUSkqPHwIGZAkN558MsYr
         efgoWfSEnQVZIg7nV9VRV/YJ25+OiUaqFBgHhDY3syPRbRm78imqW3DwZWA5ZLbLW3hz
         RnsUu9ne8fMEw1PXmYg14OchxBLyqp0lYvPDx9WZqBqWeXu2YzDdP7A2JbPuGXQpBMdL
         lzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gesujbp+9VPzg+sNjC3SXEPNRKdatpcV5h7/VQM/Pv8=;
        fh=mzpruQFSjjbYAhQxHxb2jZ27knM5CCL/uCwPZOcJSCs=;
        b=YE032/T1WS9xZCDQsyZsFOCxBI0/ldAdyAhcd0SDXSiNqgA1uGZlIuEsgP8JPZKxPO
         SxzrHYV+UMsswldSNyNEqjVYVKGGDxAP9BDEGHcVIq0zMtswB/2+LMv5ETLm+Q0rv/6z
         bGtHZXBS25phgQBsQLHFNPNBVxLx7sYGNgGnICq3rNab06wDus4gq9sGCL1qNL89pqbY
         FasBcDeTudInNizradw5CHMARf6XpKMhAkakAg0yGyASe068DhDXS8pXCPLeY8/9ct1i
         iQ650a/hfYrUpGXTULeLpER7mUggFRsJ/+JrtTZBo5GPc+jGCvEVthyScJFrC3dBl/AY
         Vh6w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778689223; x=1779294023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gesujbp+9VPzg+sNjC3SXEPNRKdatpcV5h7/VQM/Pv8=;
        b=tVJhwvxNHHUiZPcE/gd1TKeay4pKCP0EPO7Uc19MySVOZIBHegIQhLs4WwC7kRn4jY
         yHZq0tqRqaPcxg1O2LEl7uJ8E+qtKlBTNKtwVT/gF1UEwL9RYlZGIka6aCcz5jToK91q
         6eHWUANf8P2tYKA388SHLlLG51ft/gAwpjF9o9FcrGwUBJde9TOM3GweHyQh7g19j8r1
         XYfsduA3fHuRHFjVMqsR5kNxAQbXa7KMP8tQ0kY/k5zL0lioWD8dTa1pHH2kJ5XD0p12
         1yIXIxpY5nU0Z8sLj/41UQPY8Nu8cyCH8T+LlsPv7rp20YSdtL30jrg+kBjwnFNDuw4m
         BTfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778689223; x=1779294023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gesujbp+9VPzg+sNjC3SXEPNRKdatpcV5h7/VQM/Pv8=;
        b=Rx5p0Ackpt2F8QY5+SM8SUzHCWuLITkwzS5r7g6BqwMlZI1eNnaBM03/jnlKNwgTQt
         ZUk9UN7N1MLycWh95stwd0G3PBoM554X80m+yCLTJpKvHgx24Zay7zkmijmKBINer9OU
         wg5mjJ73x31ZWCHTAZlhZV4HTrs19Q3o4IqPKMsObgHahfPzXkynnRdjzXySOZ54d25Q
         yfBA8gk8b7fFJ2hADB73xcoVLMeXng7lpWdN+++CrCCc3v42d3FHJRdULXWsvDugWBKd
         Y53hlIR4fPLWC4BU5cIoR98UIl1Dq/UFTOnzZA1Ot58P4rcEE83dUiORD6XyeYrMQUgG
         L2Xg==
X-Forwarded-Encrypted: i=1; AFNElJ+L5mgCXeG8bBTIOHafkTZWcr2yEzXPJVRdVkRUlJ48rpaWelz3AZarbpJjfeFgOe88fm9gtgFf+W7iww==@lists.infradead.org
X-Gm-Message-State: AOJu0YxjtU6/AVeKFDqMUtRfOp2IMcNzJG62f+7u341rNl0XilgbN85E
	rUIRfreVgScB0lFKEU1UJZWKEt3xywSZhD8TQyd6nBdbtGqNEsBs5WzDHeAzN4YhFzdB5H7Neh2
	jFy5sWzm3BtKwIIYp18lgv2nPVgONKx6pQWFnNbNf
X-Gm-Gg: Acq92OHY+Em2sBm17qunLwnwmA7wBcT0tOtYtHeVhUMgDqW2N55AdQ3ZqRvFvIWrgEa
	Q9+KT+PQ03ghbTF0PF4fD5lNB5aHW3zHdlFGfAYa+lUNk6Rqh/vaq8XK4Sd8KqfN0uQM7cvi3Pi
	IjKTxjgQ+gtuV+V3s2TVX/FBLd3vM+l5jMP1V1dHksVPV4P2FPoAicGtFAwjjNeNHoln2YWJlas
	D0V89RwvxIqVTqcb5Ns+qAr6HVd3x8ZshU+fNZg2JRHyyMmceZRU12jkR5PQWr8uvirWxc06jiB
	mXa37noE1pHCCYoGku6KYejW8zIuL4hBwLzxB7A1wKK7x8U2
X-Received: by 2002:a17:903:2781:b0:2b0:5e19:1862 with SMTP id
 d9443c01a7336-2bd2c0e9c72mr2300165ad.5.1778689222811; Wed, 13 May 2026
 09:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260513154851.1085334-1-guanli.oerv@isrc.iscas.ac.cn> <20260513154851.1085334-4-guanli.oerv@isrc.iscas.ac.cn>
In-Reply-To: <20260513154851.1085334-4-guanli.oerv@isrc.iscas.ac.cn>
From: Ian Rogers <irogers@google.com>
Date: Wed, 13 May 2026 09:20:11 -0700
X-Gm-Features: AVHnY4Kk98DUbkHHWrvSvtIuGqRXY1KK3USIkVcwLWJvCSIgTVFGP0GHIUb5acM
Message-ID: <CAP-5=fUs0q5WQCEW-Hz2fyunsr73cnNFicUFLvU73BcPYB0u5g@mail.gmail.com>
Subject: Re: [PATCH 3/3] perf script: Provide weak stubs for instruction decoding
To: Li Guan <guanli.oerv@isrc.iscas.ac.cn>
Cc: acme@kernel.org, namhyung@kernel.org, adrian.hunter@intel.com, 
	palmer@dabbelt.com, pjw@kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_092024_515851_9B9FB43E 
X-CRM114-Status: GOOD (  17.88  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgODo1MOKAr0FNIExpIEd1YW4gPGd1YW5saS5vZXJ2QGlz
cmMuaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gV2hlbiBjcm9zcy1jb21waWxpbmcgcGVyZiBmb3Ig
YXJjaGl0ZWN0dXJlcyB0aGF0IGRvIG5vdCB5ZXQgaW1wbGVtZW50Cj4gaGFyZHdhcmUtc3BlY2lm
aWMgaW5zdHJ1Y3Rpb24gZGVjb2RpbmcgKHN1Y2ggYXMgUklTQy1WIGFuZCBBUk02NCksCj4gdGhl
IGxpbmtlciBmYWlscyB3aXRoIHVuZGVmaW5lZCByZWZlcmVuY2VzIHRvIGBkdW1wX2luc25gIGFu
ZAo+IGBhcmNoX2lzX3VuY29uZF9icmFuY2hgIGluIGJ1aWx0aW4tc2NyaXB0LmMuCj4KPiBQcm92
aWRlIGdsb2JhbCBfX3dlYWsgc3R1YnMgZm9yIHRoZXNlIGZ1bmN0aW9ucyB0byBlbnN1cmUgc3Vj
Y2Vzc2Z1bAo+IGxpbmtpbmcgYWNyb3NzIGFsbCBhcmNoaXRlY3R1cmVzLiBBcmNoaXRlY3R1cmVz
IHRoYXQgc3VwcG9ydCB0aGVzZQo+IGZlYXR1cmVzIHdpbGwgYXV0b21hdGljYWxseSBvdmVycmlk
ZSB0aGVzZSB3ZWFrIHN5bWJvbHMuCgpObyBkb24ndC4gV2VhayBzeW1ib2xzIGFyZSB0aGUgZGV2
aWwncyB3b3JrICh0aGV5IGFyZSBvdXRzaWRlIG9mIHRoZSBDCnNwZWNpZmljYXRpb24pIGFuZCBh
IHRpbWUgYm9tYiBzZXQgdG8gZXhwbG9kZSBkdXJpbmcgYW4gTFRPIGJ1aWxkLiBBcwptZW50aW9u
ZWQgZWFybGllciwgdGhlc2UgZnVuY3Rpb25zIHNob3VsZCB1c2UgcGVyZl9lbnYncyBlX21hY2hp
bmUgYW5kCmFyY2ggYXJndW1lbnRzIHNvIHRoZXkgY2FuIHdvcmsgaW4gY3Jvc3MtcGxhdGZvcm0g
c2V0dGluZ3MuIEkgYmVsaWV2ZQp5b3UndmUgYnJva2VuIHlvdXIgYnVpbGQgaW4gaW50ZXJlc3Rp
bmcgd2F5cywgYnV0IHRoaXMgaXNuJ3QgdGhlIGZpeC4KClRoYW5rcywKSWFuCgo+IFNpZ25lZC1v
ZmYtYnk6IExpIEd1YW4gPGd1YW5saS5vZXJ2QGlzcmMuaXNjYXMuYWMuY24+Cj4gLS0tCj4gIHRv
b2xzL3BlcmYvYnVpbHRpbi1zY3JpcHQuYyB8IDIyICsrKysrKysrKysrKysrKysrKysrKysKPiAg
MSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS90b29scy9w
ZXJmL2J1aWx0aW4tc2NyaXB0LmMgYi90b29scy9wZXJmL2J1aWx0aW4tc2NyaXB0LmMKPiBpbmRl
eCBjOGFjOWYwMWEzLi44MGE4ZjBlODBiIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3BlcmYvYnVpbHRp
bi1zY3JpcHQuYwo+ICsrKyBiL3Rvb2xzL3BlcmYvYnVpbHRpbi1zY3JpcHQuYwo+IEBAIC00NjA4
LDMgKzQ2MDgsMjUgQEAgaW50IGNtZF9zY3JpcHQoaW50IGFyZ2MsIGNvbnN0IGNoYXIgKiphcmd2
KQo+ICBvdXQ6Cj4gICAgICAgICByZXR1cm4gZXJyOwo+ICB9Cj4gKwo+ICsvKgo+ICsgKiBQcm92
aWRlIHdlYWsgc3R1YnMgZm9yIGFyY2hpdGVjdHVyZXMgdGhhdCBoYXZlIG5vdCB5ZXQgaW1wbGVt
ZW50ZWQKPiArICogaW5zdHJ1Y3Rpb24gZGVjb2RpbmcuIFRoaXMgcHJldmVudHMgbGlua2VyIGVy
cm9ycyAodW5kZWZpbmVkCj4gKyAqIHJlZmVyZW5jZXMpIG9uIG5vbi14ODYgYXJjaGl0ZWN0dXJl
cyAobGlrZSBBUk02NCwgUklTQy1WKSB3aGVuCj4gKyAqIGJ1aWxkaW5nIHBlcmYgc2NyaXB0Lgo+
ICsgKi8KPiArY29uc3QgY2hhciAqIF9fd2VhayBkdW1wX2luc24oc3RydWN0IHBlcmZfaW5zbiAq
eCBfX21heWJlX3VudXNlZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1NjQgaXAg
X19tYXliZV91bnVzZWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggKmluYnVm
IF9fbWF5YmVfdW51c2VkLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCBpbmxl
biBfX21heWJlX3VudXNlZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKmxl
bnAgX19tYXliZV91bnVzZWQpCj4gK3sKPiArICAgICAgIHJldHVybiBOVUxMOwo+ICt9Cj4gKwo+
ICtpbnQgX193ZWFrIGFyY2hfaXNfdW5jb25kX2JyYW5jaChjb25zdCB1bnNpZ25lZCBjaGFyICpi
dWYgX19tYXliZV91bnVzZWQsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6
ZV90IGxlbiBfX21heWJlX3VudXNlZCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBpbnQgeDg2XzY0IF9fbWF5YmVfdW51c2VkKQo+ICt7Cj4gKyAgICAgICByZXR1cm4gMDsKPiAr
fQo+IC0tCj4gMi41NC4wCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
