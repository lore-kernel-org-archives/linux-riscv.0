Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C47DC5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 12:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vInil4I1+Gzhh9Um+QOEy0pgFapdoLcgqFObx3rtXOY=; b=zxI7sCCgvWU+js
	5iHOE8oM/G9hvTEoW7Wow5AXF1WW4DSKov2CyOQP8NzthteSUfS24evKKDOeCUkVyF+IML3wPhYqB
	B3CdRc8hCNo7YsjUTBCdMenRnQQZPfK13W5PaI+KkJtsYkMrfKIxiT95xiy57ezL2AO3xoyYyCw14
	KWc6eRZ9v12JQqdyaSyXUhWWo98Xu8Q+6FP16PYF/8Nu7lmrKL5Sks2DoYYoWZpEDYOOh36v/Bnl6
	kojpwb9AT5fOsYOjcsF66J/ZD4QHbFgOUj7kXVwiuNn3dIffg0qgr/40KTVMwZ4P4p0F4iDZV5R52
	yQyXLo37QLBegUzDMOrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqWP-00000000DsD-1UO6;
	Wed, 06 Mar 2024 12:37:21 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhqWL-00000000Dqs-0hrs
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 12:37:19 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6ddf26eba3cso5102046a34.0
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 04:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1709728633; x=1710333433; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cqPFlsh8Bco+kqxKon0TchX/KllK599k66M4CaX/as=;
        b=O55J57Ml3NNZUGeVrxjkfMBifKuo0X2onV1Ir8dyrw0p3QooGWcXPQAlJD0a6KTOvQ
         mOZdyhanaExwweNAEMS4hC0AhPayJw0OG+GiD3+otoKc3k2vjCWqyu5M74QanPXZeytb
         LW9iKbvRZ1NiMu6lqvB2tVoYvXf9BWU74yr5gOy7LuEDVuL/Wr6iFgom6bjLjeCDu7V9
         IdPky6dBVZjaQbltGVZTnW386h7QzJMRfatBDmwVvQ3ZytLoD1wrFXNsiA1FOMfPn5bz
         bc4PrrSbls+yqDqFgGYRfgQ2pQw2gwz3Qha1+StUhwrwEkYSy3G8UFA7pUmmhccyDFo5
         ctdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709728633; x=1710333433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cqPFlsh8Bco+kqxKon0TchX/KllK599k66M4CaX/as=;
        b=DC++yEGOcBsWTuDD3zP1aWvz0ls7nhuVhQi/Ol6KWK3JcJ6U/0McX7SVuF/sSlKL1u
         ApHY14NsdpadYBFslM26uenA2HWQ+QxejR9lERTGiptS35mj86QpqR20/EQKtrIboczW
         buPZorJAkewvD4gFqgI7IU8bzRcOXrjkgJ+oIyiHRSMn7W+6vIP+qL5MsP6vx//ivTpB
         dX73yD6PJN1gQlSWHXdF2XbqU9x2n6oO+qkncEdwGfE+qEwWyOtl+dNO7dnuNOrUPdiY
         WL9W9Z7PFAIn+L1tXsSxlLLpD9utsrKLwh83AcusE/q+inR2FsNg2Z1ErjZQioVeHXfm
         stfg==
X-Forwarded-Encrypted: i=1; AJvYcCUO+kFRFETCgU73JRQ7r2ctwATqqtgTrpV0wjQoM+LXJcaIF38Y7AfXZuZk8wF+lKR7DbavvzsWlbriu8zO3w6//wPec7QstgxybWuzrrNa
X-Gm-Message-State: AOJu0YwLZKjfh4OorM+UenpKij8k13F/CdGzexARcR9fPgwSKUDl+vqX
	e8reo0/EWUw/qqjOSmFz5zGhe4znDdDFBcSyzFdgGG+V6eUBb0Z3XPCBHdopYIizxHLAE+8QVNH
	HNCTQZAHO3EnqNJ7hY62CtIU48K79u50OgyabbQ==
X-Google-Smtp-Source: AGHT+IE99raarX6q+utNID5LMaWjIBjAFxPBWNfijTCMPlLwR+cdCHTSC7SvbuWgUttE8dJ1rgbsjINE8A+w7wLhOCc=
X-Received: by 2002:a05:6870:63a6:b0:220:be60:b6fd with SMTP id
 t38-20020a05687063a600b00220be60b6fdmr5349995oap.13.1709728633345; Wed, 06
 Mar 2024 04:37:13 -0800 (PST)
MIME-Version: 1.0
References: <20240306085622.87248-1-cuiyunhui@bytedance.com>
 <20240306-zippy-magazine-9a4ecfe1758a@wendy> <CAMj1kXG6k5SZDYwdxhoJDiNxUuAqBOqqANUiys4YTCk_HCF5AQ@mail.gmail.com>
In-Reply-To: <CAMj1kXG6k5SZDYwdxhoJDiNxUuAqBOqqANUiys4YTCk_HCF5AQ@mail.gmail.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Wed, 6 Mar 2024 20:37:02 +0800
Message-ID: <CAEEQ3wnb7k7CXaZmNHaqCVH7OjY3dX7yn9G+KB7dbuGmm_WB=A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 1/3] Revert "riscv/efistub: Ensure
 GP-relative addressing is not used"
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, xuzhipeng.1973@bytedance.com, 
	alexghiti@rivosinc.com, samitolvanen@google.com, bp@alien8.de, 
	xiao.w.wang@intel.com, jan.kiszka@siemens.com, 
	kirill.shutemov@linux.intel.com, nathan@kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-efi@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_043717_494006_CAC726F6 
X-CRM114-Status: UNSURE (   7.18  )
X-CRM114-Notice: Please train this message.
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

SGkgQXJkLCBDb25vciwKCk9uIFdlZCwgTWFyIDYsIDIwMjQgYXQgNTozOOKAr1BNIEFyZCBCaWVz
aGV1dmVsIDxhcmRiQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gV2VkLCA2IE1hciAyMDI0IGF0
IDEwOjAzLCBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToK
PiA+Cj4gPiBPbiBXZWQsIE1hciAwNiwgMjAyNCBhdCAwNDo1NjoyMFBNICswODAwLCBZdW5odWkg
Q3VpIHdyb3RlOgo+ID4gPiBUaGlzIHJldmVydHMgY29tbWl0IGFmYjJhNGZiODQ1NTVlZjllNjEw
NjFmNmVhNjNlZDcwODdiMjk1ZDUuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IFl1bmh1aSBD
dWkgPGN1aXl1bmh1aUBieXRlZGFuY2UuY29tPgo+ID4KPiA+IFJldmVydHMgYXJlIGNvbW1pdHMg
dG9vLiBZb3Ugc3RpbGwgbmVlZCB0byB3cml0ZSBjb21taXQgbWVzc2FnZXMKPiA+IGp1c3RpZnlp
bmcgdGhlIHJldmVydC4KPiA+Cj4KPiBJbmRlZWQuIEFsc28sIHBsZWFzZSByZXZlcnQgdGhlbSBp
biB0aGUgcmlnaHQgW3JldmVyc2VdIG9yZGVyIHNvIHdlCj4gZG9uJ3QgaW5hZHZlcnRlbnRseSBi
cmVhayBiaXNlY3QuCgpPa2F5LCBJJ2xsIHVwZGF0ZSBpdCBpbiB2Mi4KClRoYW5rcywKWXVuaHVp
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
