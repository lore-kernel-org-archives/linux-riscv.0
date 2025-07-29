Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5613BC87FC9
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 11:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dNP8eaHutdH6J4Xi0Hq48mllzaEvpmvTuBko9+htS3c=; b=dq63OTLxF/hGpJ
	wv11cPhG2L+bYqkHXBt0n3o2vOvbVQ/FCfEQ/qqjt5fZICcVmThs4hEY0SZodzDYN2+8Wh5r8B/tb
	Uplh8h5UQmoGyBN9bO5BWCnofizUiugxRs65m6V2woDb2gKFBQZo8NbC4e/MiWG6+zTYkzyv5uPBt
	VA024E6dEhbLuuVmwspyPPo+V2vUICphW82eQlyAJdAuAPPSeUIMMlIB1ZUqpl4CO8nzg62BAf9lU
	bu+/mjJ4kf6fxx2vDPX5H9/I/LHr06PNVYb2phsC8vG2vYi4PmhL6UzZHL4/brZU7bS9C/3w6d2UC
	67OaVJe9s9GmurZRdYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiz3-0000000Gfiw-3Eok;
	Tue, 29 Jul 2025 11:59:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugiz0-0000000GfgY-21qi
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 11:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753790341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Mt286fE3fr9exZwFOAwUHjGEk4EhTOfKtbO13ISjIXE=;
	b=fvEEyjkBND5+SSdW4ro5fnbxhT37CAgSidlTzJ8p6ScoArUsWb46HnVnSuT4Bxzu2n7ciD
	43wn8LF3zhQeN2FGLMjINq9KUifzb6LWEpDWvRP1tSxtH1aZMPAceKiPd1I/fSHqtgWmye
	BAxi15QTIktKneWR9/jCdbzlnL47pqM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-2Lo0JjKMMDCAMmlAyaoyEw-1; Tue, 29 Jul 2025 07:58:59 -0400
X-MC-Unique: 2Lo0JjKMMDCAMmlAyaoyEw-1
X-Mimecast-MFC-AGG-ID: 2Lo0JjKMMDCAMmlAyaoyEw_1753790338
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4588cfda8b6so6955785e9.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Jul 2025 04:58:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753790338; x=1754395138;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mt286fE3fr9exZwFOAwUHjGEk4EhTOfKtbO13ISjIXE=;
        b=afsxr6xW5tRC/CjckaKnjhessZ+ey2MrkeUwrD0X1G2gDYgysWjOayqQphd3qDijlU
         VqRCc9crEL3etfH3YvWX0j5tNgE08Jn2UFb7o38icnOVScCV2H6MzPemTb2o4JtfINBH
         xn3Wmo3ZtHuzlynBzNMhCFh+nwGILvbcnUKoxxWJ8biQyIBMc/ywBSwzLJTbDMcp8yOh
         3Sijsg7/pnonMkKgrapVcUMKdvb32+Z2eWVJnbqIE6HTv0+8tUChl/XVqV2MAt4b0iMJ
         uPxzKhAjNvB0uqtmfwyyu3P8n1aLfOtm23MPc5tdYzViQStng56pfrxGS8oZgPeX6svM
         hewA==
X-Forwarded-Encrypted: i=1; AJvYcCVRmiaxLsLk+G09p4Zyd+dn8D+Zbl0Epg6biZs2oqbmuwRVTchB4vt6kq33Iv6Dbm5Nlb54hmVgK0WzIA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrlQQ+rWx8Vd7l7u4T3dBVO1gTymJ17bJxGpiti8IvzQt8G46b
	iHm4lN4t7HNP7ZHVxM2rypKX+9+k4fJMdIZFt4zoXBoCTI5GZf3cJ68lopkJnuqJdNCqOMnzfPH
	ean+W93dByleJa9qF1UNWezHegBUpr0slEBQoT5NFgS54nP4fMdr1DLzpk1YamL8V3TVlZg==
X-Gm-Gg: ASbGncv6ruG3fNV/NWWD1quYBrCAlCLu0aBm6oOwcx3KBn8NCqUTuoCzvKE9pxOOgrb
	KRLJyHVkagBs5SeCH9k8ZOFHWt5NGeBNDWZTKfNlpJ6kU7H69w78acE4udwv0j8+syjuYw1Od0G
	abERC5++35Xwo6ahvlhcRrwc8rFmhbHijxlN/eBuJi8ridpDXo31J/p9TabuOp58LxCjAvtMxZR
	7geWZZ7Of08b9r82h/iMuKRFSK90y+0Drg+paNQNLx4BnXhrNYHYXu9IFQFSYXcqxEhmcmjfOWo
	LC7+wx4otabLk8iOOxM6zVvHV+9R2U14fK9gNIGJVz6E
X-Received: by 2002:a05:600c:1992:b0:455:fc16:9ed8 with SMTP id 5b1f17b1804b1-45876651bfamr150542685e9.30.1753790338310;
        Tue, 29 Jul 2025 04:58:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHi4+v6oNFjQhbcYthmDOzNaUqcEt6rvGHmIzYzlsi7OQ7zXry3yI7rWQcJKU17VzbPC5UuOg==
X-Received: by 2002:a05:600c:1992:b0:455:fc16:9ed8 with SMTP id 5b1f17b1804b1-45876651bfamr150542175e9.30.1753790337511;
        Tue, 29 Jul 2025 04:58:57 -0700 (PDT)
Received: from [192.168.10.81] ([151.95.154.122])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3b7908161e3sm2262031f8f.37.2025.07.29.04.58.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Jul 2025 04:58:56 -0700 (PDT)
Message-ID: <a486e649-d2c0-471c-87f2-c7a01dff9ae4@redhat.com>
Date: Tue, 29 Jul 2025 13:58:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] KVM/riscv changes for 6.17
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Jones <ajones@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>,
 Atish Patra <atish.patra@linux.dev>,
 "open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)"
 <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-riscv <linux-riscv-bounces@lists.infradead.org>
References: <CAAhSdy12xtRRem-AybfymGHh+sj4qSDDG0XL6M6as=cD5Y2tkA@mail.gmail.com>
 <CABgObfYEgf9mTLWByDJeqDT+2PukVn3x2S0gu4TZQP6u5dCtoQ@mail.gmail.com>
 <CAAhSdy3Jr1-8TVcEhiCUrc-DHQSTPE1RjF--marQPtcV6FPjJA@mail.gmail.com>
 <CABgObfaDkfUa+=Dthqx_ZFy418KLFkqy2+tKLaGEZmbZ6SbhBA@mail.gmail.com>
 <CAK9=C2VamSz4ySKc6JKjrLv9ugcTOONAL4+NmKAexoUgw7kP6w@mail.gmail.com>
 <CABgObfZu2fPFaSy2EHzpD_MUwYYeYMfz6BfXmTw_h3ob1q2=yg@mail.gmail.com>
 <DBOIBORLK6YM.7SND5YPEJR60@ventanamicro.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <DBOIBORLK6YM.7SND5YPEJR60@ventanamicro.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lCfPWJ7AyaIPSeWoY_6b2KIb9UAoEOj2Lh0zsVCzvy0_1753790338
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_045902_594239_F463D31F 
X-CRM114-Status: UNSURE (   8.88  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNy8yOS8yNSAxMzozNywgUmFkaW0gS3LEjW3DocWZIHdyb3RlOgo+IFNvcnJ5LCBJIGRpZG4n
dCB0cnkgdG9vIGhhcmQgdG8gY29udmluY2Ugb3RoZXJzIGFmdGVyIG5vdGljaW5nIGl0LCBhbmQK
PiBwbGFubmVkIHRvIGZpeCB0aGUgbW9zdCBzaWduaWZpY2FudCBicmVha2FnZSBpbiBsYXRlciBy
Y3MuCgpZb3Ugc2hvdWxkbid0IGhhdmUgdG8gY29udmluY2UgYW55b25lLCAKRG9jdW1lbnRhdGlv
bi92aXJ0L2t2bS9yZXZpZXctY2hlY2tsaXN0LnJzdCBpcyBwcmV0dHkgY2xlYXI6IG5ldyBzdGF0
ZSAKbXVzdCBpbmNsdWRlIHN1cHBvcnQgZm9yIHNhdmUvcmVzdG9yZSwgbmV3IGZlYXR1cmVzIG11
c3QgZGVmYXVsdCB0byBvZmYsIAphbmQgdGhlIGZlYXR1cmUgc2hvdWxkIGJlIHRlc3RhYmxlLgoK
VGhlIGZpbGUgd2FzIGp1c3QgdXBkYXRlZCAoYW5kIG5vdyBtYWtlcyBmdXJ0aGVyIHJlbWFya3Mg
YWJvdXQgdGVzdGluZyksIApidXQgdGhlIHNhbWUgdGhpbmdzIHdlcmUgYmFzaWNhbGx5IGluIHRo
ZSBvbGRlciB2ZXJzaW9uLgoKU28geW91IG5lZWQ6CgotIGEgS1ZNX0VOQUJMRV9DQVAgdG8gZW5h
YmxlL2Rpc2FibGUgRldGVAoKLSBhbiBpb2N0bCB0byBnZXQgdGhlIGxpc3Qgb2YgRldGVCBmZWF0
dXJlcyAoa2luZCBvZiBsaWtlIApLVk1fR0VUX01TUl9JTkRFWF9MSVNUIG9uIHg4Nj8gIEl0IHNl
ZW1zIHVubGlrZWx5IHRoYXQgeW91IGdldCBtb3JlIHRoYW4gCjUwIG9yIDYwKQoKLSBhbiBpb2N0
bCB0byBlbmFibGUvZGlzYWJsZSBGV0ZUIGluZGl2aWR1YWwgZmVhdHVyZXMKCi0gdGhlIEdFVC9T
RVRfT05FX1JFRyB0byBtaWdyYXRlIHRoZSBzdGF0ZSBldGMuCgotIHNlbGZ0ZXN0cwoKCj4gKElm
IEZXRlQgd2Fzbid0IGVuYWJsZWQgYnkgZGVmYXVsdCwgc2FuZSB1c2Vyc3BhY2UganVzdCB3b3Vs
ZG4ndCBleHBvc2UKPiAgIEZXRlQgdG8gdGhlIGd1ZXN0IHVudGlsIGEgcHJvcGVyIEtWTSBjb25m
aWd1cmF0aW9uIHdhcyBhZGRlZCkuCgpUaGF0IG1lYW5zIHRoYXQgdGhlIGJhcmUgbWluaW11bSBm
b3IgaW5jbHVzaW9uIGluIEtWTSBpcyB0aGUgZmlyc3QgdGhyZWUgCmJ1bGxldHMgYWJvdmUuICBC
dXQgYXQgdGhpcyBwb2ludCwgbGVhdmluZyBvdXQgdGhlIGZvdXJ0aCBpcyBqdXN0IApzbG9wcHk7
IGFuZCB0ZXN0cyBhcmUgbm90IHJlYWxseSBvcHRpb25hbCB1bmxlc3MgeW91IGhhdmUgYWxyZWFk
eSBwb3N0ZWQgCmEgdXNlcnNwYWNlIGltcGxlbWVudGF0aW9uLgoKVGhhbmtzLAoKUGFvbG8KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
