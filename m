Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11B12D13C1B
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 02:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=awbYJIXhG2qVO4Qq7kYl0tI4XNu3I8Tppgdh8dW3nzk=; b=RHRjlsnSHsdOZY
	mmCM+S7fpOZ7qHGxe4wF0t/siPv+6tb4qDsc504/OK7UjeLzxMWckdARWR39nRnolZdeA6CFZfWIk
	uX0/nq0htoTOgJkvhkptJPU8JHOZZei4tqpyWA6ZkDl3b2Dewf1tNXfUwwmRsuKYxA1n+Cmi9ru07
	9vapRP/0TF97hjYa2dB5UyAy4YD74YzCc8u9xXxzNF7d5HFJq40rxn/fxwDrcGBE6tt3ClFVrVc/w
	E0KZJeD5Aq14Z2qvEwZDihYWIZmLo1U+vqaVv1RCMEepg4lMDqxhwkv6vk5o5gftpZd4s+8lDAx9X
	EINd5Uy48V9eoNzSKJKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYtz-0000000DUhf-0LKV;
	Tue, 27 Jan 2026 02:33:59 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkYtw-0000000DUhI-2Gn2
	for linux-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 02:33:57 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-6446c924f9eso4450254d50.1
        for <linux-riscv@lists.infradead.org>; Mon, 26 Jan 2026 18:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769481235; cv=none;
        d=google.com; s=arc-20240605;
        b=iFrIsb9wzXyxBNW16ivhBQEjSWJgTfBDosELveZhnBrJ8MjMllP0nplntodyXz/CiP
         UIcDPoQmc0lr/GHCKNVSisVyQwQmQQMfCsabieKnH7Wj9ja/e113Q51aywbsa+5YGJir
         2Iz5zeCaXZjHeZj7og59YDF4i3Dn6sCFj4C9XQO8mNyxF1cnLWr84Ga4F3/f+Rz0kg/5
         lN+6hhvas9wZgGu4HFjOwExA72WeuPkW8ZeVdPcra6a24jmk7rfV2EAb9dVTJRrE65LT
         PGitcCBUcyhOlkaat0GsD3txWJ4vwg3IWgoXvz3hAaTQ3bjejQdNLHQt/hjMRZaPL0gd
         QjLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wnhaptmtQTA7JxU4MBG5PTLQDrXwDGYuJ0Tg+46DiE0=;
        fh=dVEWOBs3qk0Oh97oh4alqHPauj7XkdeE+MBuYEmztd4=;
        b=iriAAgED6VeTRmUnFAwOBGxtWLx++s2TjiW76+ckbap0wal9NNQ1sU8YfFhQDz3PC5
         56Blz80MJ3HO3CQcMRPlczi5LwygyrxRoIa2aO2/gkBB0uoNnWHGtFL/GQlxMQZduVmV
         X/pQd48tmUiuI0YeFwFa2KNrhoobmjyfyMI2lVHN/RjS/jaTt0lSVra6Loomv/8S3MU4
         7JmhwjiBMccXk76Bj6NFikj8QuwA7E7iudOWJlcaFDGtaE4Phvf/Vxnv3Bw+6ZgevoHc
         yIgTDPJGPfw/Frjt2a/iGPOi3a1G4c8La6PNvZAVtAZ+MXtgoxlIsW2MWe8bFJiZLHiR
         RzZw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1769481235; x=1770086035; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnhaptmtQTA7JxU4MBG5PTLQDrXwDGYuJ0Tg+46DiE0=;
        b=i/2Jz4p8ZMGI6/IKS0ARwH0eA5TG7bcaTVCXa+/BoKT1DF24QNgknd9TJa5fuJYAOP
         AIQnnK86/aQ89laaVISgYwFX3Je43xAyG0pYtK47mLNnu+brPZVYUi8bvDG2/OPVYqW/
         XHFRyrQ8Muw/xVqIh0HOtgkFu0WDCvq5XyBIm8PPiXvIleXQFgvo4gJHmVFx+cynY43k
         MP4KaWbFy+GH0c56GoyTt2fLwRp4W2hKiaBs2JNIsyiPllwsKmDOO93jvf1qkZBZzSYb
         8jqatEl2s8EcJnZfDVfntEsn3knPvECUytbCpXxzHSqxxCbdGP3Hh9hPMZ4rxU/zc0uJ
         pDpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769481235; x=1770086035;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wnhaptmtQTA7JxU4MBG5PTLQDrXwDGYuJ0Tg+46DiE0=;
        b=vsZJdQlPnr5jHwpmno3QYoScaLi0VtPw/lIZBy5xRSiMrfBzlTQgPoMGIWhlSumXtx
         IuzWlEH+FsMQVYGt20iI6g14pUAdY3P8bbUmo35cVELnc9VEK5z3Onvum6nz0eRH4rPh
         ndvmyaJrCyzXT98hQ6YcL4GKeLMzQvWx1G9/mCx3l2ElS2gnLCf6bB08qjGjdzVYwMw2
         LAwrBOc1o/agpMWRf2EmH7B5Ujz/Rhi1EIMdwEIh9wFUu4sJGUwiE3y8upnUyuhlTKhr
         l/TkjjcZvEGDM6tLLr62fntQOTnOn9Dj0wLr8P3zUSPVMpx7Rms8UfITaklEU+rEJBfv
         9MYg==
X-Forwarded-Encrypted: i=1; AJvYcCWS62JhDVQGB6gWjIVniSMyUgFkFZLoAx+LA3+w2eCjf794Es4WsQqLxSLLV2srTGzdQjReOqs6cpk2zQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY0GJD+rGC2PzPAicO1zXxBAZsTnHVKwEgPqAGZipUJBuzAnaf
	RA2ckrro5Vpl1tkuD0FtIYb3tFgx3V0nc0qNjgDA0PnduW9FR5EG3Q3GYOcygeZzC+ijcHOLq2h
	2wAHu/NrzXwD625aFSzRLq6L/6vFx4Pmz8NgI2/yDtg==
X-Gm-Gg: AZuq6aLdmk/Pn1DVKc5eZo5gbVQYsIYR4wVOpedgI2TZGvXxsRUq30LrSJsWeDXoqH6
	RMai9xJGwlkscKsqF7e4EhENhoxftOUpBP8NoZ6SajAhO//TihN5H+XLV1JA+oLKpEEdT9kqXij
	ha/y36uwaoXGC/mLL2zmwJGhQMi/eTzXumtSM2fZTTEQr+i5OpDJXAclhrEZc8Vkc5vCWL2yRBk
	qDTPSR8W5GPr21oMWSYiFfrxE9fl1ewHyNPOSrYanRMJizNw73GLT+iDna+GHWATlCaevz4ev86
	PQ==
X-Received: by 2002:a05:690e:1c1c:b0:644:53d2:a698 with SMTP id
 956f58d0204a3-6498fbf5009mr54384d50.34.1769481234990; Mon, 26 Jan 2026
 18:33:54 -0800 (PST)
MIME-Version: 1.0
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
 <CAEEQ3w=0_JvE0nuJ=F_RHsBE=tbV5j0ycgT_k3kYPLE_ixOExw@mail.gmail.com> <aXfKYokyKJ8oassV@x1>
In-Reply-To: <aXfKYokyKJ8oassV@x1>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Tue, 27 Jan 2026 10:33:43 +0800
X-Gm-Features: AZwV_QiA23kiB68WdyQnej2C57ua4snmGQ3t9gJKKg_GFzgdJ-hZdgu2hYe-BSQ
Message-ID: <CAEEQ3wnxFyCDL0swL4ymWupKj3M+TsbEtFn+CPx2t_1sZS1PdQ@mail.gmail.com>
Subject: Re: [External] [PATCH RFC 00/19] RISC-V: QoS: add CBQRI resctrl interface
To: Drew Fustini <fustini@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	=?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Adrien Ricciardi <aricciardi@baylibre.com>, 
	Nicolas Pitre <npitre@baylibre.com>, =?UTF-8?Q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
	Atish Patra <atish.patra@linux.dev>, Atish Kumar Patra <atishp@rivosinc.com>, 
	Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
	Chen Pei <cp0613@linux.alibaba.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
	Weiwei Li <liwei1518@gmail.com>, guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Reinette Chatre <reinette.chatre@intel.com>, 
	Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
	Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
	Dave Martin <Dave.Martin@arm.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, x86@kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_183356_598543_CBE8A78B 
X-CRM114-Status: GOOD (  17.71  )
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

SGkgRHJldywKCk9uIFR1ZSwgSmFuIDI3LCAyMDI2IGF0IDQ6MTHigK9BTSBEcmV3IEZ1c3Rpbmkg
PGZ1c3RpbmlAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEphbiAyNiwgMjAyNiBhdCAw
OToxNDoyNFBNICswODAwLCB5dW5odWkgY3VpIHdyb3RlOgo+ID4gMS4gV2hhdCBhYm91dCB0aGUg
cmVsZXZhbnQgbG9naWMgZm9yIG13ZWlnaHQ/Cj4KPiBNeSBpbnRlbnRpb24gZm9yIHRoaXMgc2Vy
aWVzIGlzIHRvIGp1c3QgYWRkIHN1cHBvcnQgZm9yIGZ1bmN0aW9uYWxpdHkKPiB0aGF0IG1hdGNo
ZXMgdGhlIGV4aXN0aW5nIHJlc2N0cmwgc2NoZW1hdGEuIEkgdGhpbmsgbXdlaWdodCBjb3VsZCBi
ZQo+IGFkZGVkIGxhdGVyLiBUaGVyZSBpcyBhY3RpdmUgZGlzY3Vzc2lvbiBbMV0gYWJvdXQgaG93
IHRvIGV4cGFuZCBzY2hlbWFzCj4gaW4gcmVzY3RybC4KClRoZSBjb21tb24gbGF5ZXIgbWF5IGNv
bnNpZGVyIGFkZGluZyBhIHJlc291cmNlIHR5cGUKUkRUX1JFU09VUkNFX01CX1dFSUdIVCAoc2lt
aWxhciB0byBSRFRfUkVTT1VSQ0VfTDMpLCB3aGljaCBjYW4gZXZvbHZlCmluIHRhbmRlbSB3aXRo
IHJlc2N0cmwgaW4gdGhlIGNvbW1vbiBsYXllci4gVGhlIFJJU0MtViBRb1MgbGF5ZXIgc2hhbGwK
aW1wbGVtZW50IHRoZSBsb2dpYyBmb3IgbXdlaWdodCDigJQgdGhpcyBwYXJ0IGlzIGZpeGVkLCBh
bmQgaXQgaXMKcmVjb21tZW5kZWQgdG8gYWRkIHRoaXMgbG9naWMgdG8gdGhlIHBhdGNoc2V0LiBS
QldCIG9ubHkgcHJvdmlkZXMKc3RhdGljIGNhcGFiaWxpdGllcywgd2hpbGUgbXdlaWdodCBlbmFi
bGVzIGR5bmFtaWMgdHJhZmZpYyBsaW1pdGluZwpmdW5jdGlvbmFsaXR5LCBtYWtpbmcgaXQgcXVp
dGUgaW1wb3J0YW50IGluIHRlcm1zIG9mIG92ZXJhbGwgZmVhdHVyZQpzdXBwb3J0LgoKPgo+ID4g
Mi4gV2hhdCBpcyB0aGUgc3VwcG9ydCBwbGFuIGZvciBJT01NVT8KPgo+IFNpbWlsYXJseSwgSSB3
YW50ZWQgdG8gbGFuZCB0aGUgYmFzaWMgcmVzY3RybCBzdXBwb3J0IGJlZm9yZSBleHBhbmRpbmcK
PiB0byBvdGhlciByZXNvdXJjZSB0eXBlcy4KCkFscmlnaHQsIHRoaXMgcGFydCBjYW4gYmUgaW5j
b3Jwb3JhdGVkIGluIG9uY2UgdGhlIHJldmlldyBmb3IgdGhlCmNhY2hlL21lbSArIEFDUEkgcGF0
Y2hzZXQgaXMgbmVhcmx5IG1hdHVyZS4KCj4KPiA+IDMuIENhbiB3ZSBhbHNvIGFkZCB0aGUgcGF0
Y2hlcyB0aGF0IHN1cHBvcnQgUlFTQyB0byB0aGlzIHBhdGNoc2V0Pwo+Cj4gSSdtIGFib3V0IHRv
IHNlbmQgaXQgYXMgcGFydCBvZiB2MiBvZiB0aGlzIHNlcmllcy4gSSByZW1vdmVkIHRoZQo+IHBs
YXRmb3JtIGRyaXZlcnMgYW5kIHVzZSB0byBBQ1BJIHRvIGJvb3QgdGhlIHN5c3RlbS4gSSB3aWxs
IGZpbmlzaAo+IGVkaXRpbmcgdGhlIGNvdmVyIGxldHRlciBhbmQgc2VuZCB0b2RheS4gVGhlIGI0
L3NzcW9zaWQtY2JxcmkgYnJhbmNoCj4gY29udGFpbnMgd2hhdCB3aWxsIGJlIHRoZSB2MiBzZXJp
ZXMuCj4KPiBUaGFua3MsCj4gRHJldwo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2Fs
bC9hWFVLN1hGc0hsK2dud0ElMkZAeDEvCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS90dC1mdXN0
aW5pL2xpbnV4L2NvbW1pdHMvYjQvc3Nxb3NpZC1jYnFyaS8KCgpUaGFua3MsCll1bmh1aQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
