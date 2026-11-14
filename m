Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1843F606A327
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o2d+1l7h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=LcsHt2HO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=N3R0NL36lkB9Hsjw6mAfJENV6Dzyphqfewxf5SQCtps=; b=o2d+1l7hI4rnrSGGWwPLPU1cz6
	MI5qfb54hgozCYh/HP8H7XpnByULg6Mf87dmVyvcY0d1w0/300mh7+KiWJIcP4syykA9csWeT1LdZ
	prFALTov9x4eQsqLVbOuwy1l+kQBt3pER3aBsihqIj+KfywSOLzDSC34qyZwyZOeHBg5Ycc9w72Yd
	yMjh4qGRuNUGXDaQc8k/e9QJjC4y4R4oopuoO9lVk2XdIflF99IhvEhNG/iZD/S6CcgWik1mycTkm
	oEzU7fcQyqLBxwjdjpaZOD7ilg+74L6wTLBrkmo8E4Oxds5f7vcPQdG2Dw9BD/7fre71g5HmuL6cX
	PKxUSuXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDv3-0000000G7w5-0Cbc;
	Sat, 14 Nov 2026 13:35:49 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDuz-0000000G7vC-0hxk
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:35:46 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5c17a1775fcso982458e87.3
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 05:35:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794663342; cv=none;
        d=google.com; s=arc-20260327;
        b=Jgduh1xWMG3o/bdQ5mr/SZW/648cosaegP4k8qaMBa2/Hy1m0hz96ViBAkEkzWMZLg
         lPxvucCioqX2Fk8cypP2iBlrBewlUu+b2kF5g+d8iN8UdA5iSsGRl8zRCwjgiDA6sndc
         my19Jlj0MWMcjDw9VbmbHDsxjDHABzDDaHQbxG1f2J7Ctu6qJ+VamrvbhkjdVjw+DNxL
         uTMXc12qoEFElSNFDBbzAC5z8Koypc7FaRXbTfwXlHpt6fK2vVsJiuMxrKSftOkBUyKW
         sleCXDYMpZdlTpjEjU6oC/HNmhhiixW6muMElRUVnekrTtiLATPEhIljVgfdWVeu/TLA
         Kg1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        fh=Db7OMaBf8g+s7j7Dw6Uaznd9NDeJ7k5cucXFHgsa8Bg=;
        b=ltefaheGRzPEwzel25SehFHTk5zVznWZUjUJWrTUJsEMovr8G7+bZEJc/sV1nf6rzY
         gK1MNPSTcRaNz3ukpIR5TinrgtUkKPf56hQx0trGnK+IEVCrXG/F6Oc7vmmhDzDDMYOv
         5ftUYKsyN+sWNpc2/cSbivS7RHIw+00d1PgI7hlOho5jIOITrWTnL/ElohWNjyP9P12p
         zrS/Bf9TjaF85e8ECz+JHpM0rUFRUe9YVNhnkh/uFTlvO2mYS6TUEx4DzU2TUuHckrBG
         9s4Mrxj6LAEeTW1iOXxjU405bl8oGJqENJRtILuRcM5M3aiOuLtdPyvCm3gJV0LF3C30
         /tLg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794663342; x=1795268142; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        b=LcsHt2HO8JpupvCF+l6OIozNCDU1o35gwSzDQt0UCqGso9FSwuDcXt3H/NkvDQgzLY
         LUiVySWeNUOMlL7dCKiDiiDkAcyv49nWar7LyeQul9PPV9Ac0sbk1iaj32pZcKhMyi3o
         CLkglsDYf7153yQzqma7E+91TtWJwVPGu7EAMcxXXJrJaivV1XICejgE8ovEIfQXXRjf
         7MDmMS+TC/hBPaH8tdfjZskMKcJIvVCqhKkVsbRq23zDuz1EoeCksCKW11w9D+YTyYIs
         NOVWdH5+ppFy/VNpPWv6o+RMjcTUeN8oWVfeB2gJoJ8oj5QoOedKpjvlrtH3XO3VLTx9
         PXbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663342; x=1795268142;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7nxs2ziyKSXajCogouyEEECBltRg0HZJSOSZE1z6bs=;
        b=LbRaoRF4ZwK5l58b/krupnzSwExoC9ulm8Pw/1lhimb+2txc1PMtbipo8q5x7HuUh8
         oIEHSs6jf2WJTBVoHVf2IaK0unmtHn6gTBrS3VGJON5w105T8o8UKYi8m2CKJhSjZjYF
         XLpVePHjFoMCUqXeQ6UlvVflkTBeDgCLA1AQhop57R0JdN0K3t/68JlGcMKZEMUo3NK4
         /6Tm6JvWUN6DXOs33HnyygHR0hsQQ8TWq7fyzz52CHIlv/2u5Wf+G55/IbyyQa3o0Lq+
         +LSvRsCrCOsZ6DjSZWe8kixw1Ukk/yRupehwN4j3unf02XPhPNbNFh8E4Xvogr0rY5WL
         camA==
X-Forwarded-Encrypted: i=1; AL+hErE/zckj8Wr3jO6TkU+3En3M4FIWzH190v9ttV3ppoLN3/AOCfKlzB885N6GNE+1VCtI3wEJ+P4cHY53Qg==@lists.infradead.org
X-Gm-Message-State: APuU4Z+aOfLT/pdIvF5q9jNyqdO/9bFwmyQsMJU5YXhTRK/3r4V1Nu/b
	U77LWNMA3z8GJnhf1sCgpNf/4lip4d32IhaFr4mn30fMIr+jOKyxcfOIiqq4qm4pjtuWOy3yUpq
	fNBSkQgyW5c7ash6kdO337AYv9ksW7WGLdgU21KHHIw==
X-Gm-Gg: AYBFou2ohpCHZM440KQB2RaxcgCMji6Mv3z+nuXefNmWIAOz0La8PqzxqOZvDWXPjuW
	W+BP0XxNIRsFtvbeyxSeMPinUCpgu90ZQy2UymUYP0SPrGKkIl5/E19NpmHa545RPfRbKM4LnFK
	ji1WI7bf0UvBzTzR/ggyF7ls06kpXuR2yUPDCfW/lAYyDs+luLr1bZEviw41q6p/kF76yJUVtti
	4cUIzznvmWGCxYpbNDzy6CwgMx6+Vg8T3/vtKyBh+b2dCxLLFW9RJioLEkpqke0JHGtKqu85gqN
	NoDZCkhRGxQJqMKN2uu9mByiw9z1PdepKATqlhPifMtevEWxcGzvsmuSw9rT/AMvaaEzyQDH42g
	USikCWXEmfidIsjT6J/1oZKQiRYyS7tuh4JuZjR/VsZXHtKHuIIhfBwejHUxjU7dBBJ7dwPH7Qk
	he9uU8XXYIJnmKkAmA3AmtFBc6yGJhAPalh8n5sK9DmSybpTVC1o8rAQ==
X-Received: by 2002:a05:6512:a84:b0:5c1:5171:4ad7 with SMTP id
 2adb3069b0e04-5c170b383ddmr2080350e87.33.1794663341999; Sat, 14 Nov 2026
 05:35:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023142550.148604-1-oleksii.kurochko@gmail.com>
 <CABBgwmuBBbyBytwRBTeAqF=0c1m+TFK8E3yPopGNQAsrMFO2vg@mail.gmail.com> <7e634bef-6d23-4a57-b3e6-b5585045ca19@gmail.com>
In-Reply-To: <7e634bef-6d23-4a57-b3e6-b5585045ca19@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 14 Nov 2026 19:05:28 +0530
X-Gm-Features: AclHuK9nWY20qy2LdzPDWoj5LiIWjiiPX9NCcLCEPiqITYBgVdXOX7JbUWJZ-OQ
Message-ID: <CAAhSdy2cL6u_pAinYFU64nfqespQU+2x3GTeiqvjFUbJyYLLMA@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Order IMSIC VS-file write before releasing vsfile_lock
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Anup Patel <anup.patel@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_053545_274450_6EF6B0EF 
X-CRM114-Status: GOOD (  47.39  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gRnJpLCBOb3YgMTMsIDIwMjYgYXQgMTE6NDnigK9QTSBPbGVrc2lpIEt1cm9jaGtvCjxvbGVr
c2lpLmt1cm9jaGtvQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPgo+Cj4gT24gMTEvMTMvMjYgOTowMCBB
TSwgQW51cCBQYXRlbCB3cm90ZToKPiA+IE9uIEZyaSwgT2N0IDIzLCAyMDI2IGF0IDc6NTbigK9Q
TSBPbGVrc2lpIEt1cm9jaGtvCj4gPiA8b2xla3NpaS5rdXJvY2hrb0BnbWFpbC5jb20+IHdyb3Rl
Ogo+ID4+Cj4gPj4ga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdCgpIHdyaXRlcyB0aGUg
aW50ZXJydXB0IGlkZW50aXR5IHRvIHRoZQo+ID4+IFNFVElQTlVNIHJlZ2lzdGVyIG9mIHRoZSB2
Q1BVJ3MgSU1TSUMgVlMtZmlsZSB3aGlsZSBob2xkaW5nIHZzZmlsZV9sb2NrCj4gPj4gZm9yIHJl
YWRpbmcuIFRoZSBsb2NrIGtlZXBzIHRoZSBWUy1maWxlIGZyb20gYmVpbmcgc3dpdGNoZWQgdW5k
ZXIgdGhlCj4gPj4gaW5qZWN0b3I6IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY191cGRhdGUoKSBh
bmQKPiA+PiBrdm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfcmVsZWFzZSgpIHRha2UgaXQgZm9yIHdy
aXRpbmcgdG8gbW92ZSB0aGUgdkNQVQo+ID4+IHRvIGEgbmV3IFZTLWZpbGUgb3IgdG8gdGhlIFNX
LWZpbGUsIHRoZW4gcmVhZCBhbmQgY2xlYXIgdGhlIG9sZCBWUy1maWxlCj4gPj4gYW5kIGZyZWUg
aXRzIEhHRUkgbGluZS4KPiA+Pgo+ID4+IE9uIFJJU0MtViwgd3JpdGVsKCkgaXMgZm9sbG93ZWQg
b25seSBieSBtbWlvd2Jfc2V0X3BlbmRpbmcoKS4gVGhlCj4gPj4gdHJhaWxpbmcgImZlbmNlIG8s
dyIgaXMgZGVmZXJyZWQgdG8gc3Bpbl91bmxvY2soKSBieSB0aGUgbW1pb3diKCkKPiA+PiB0cmFj
a2luZywgYW5kIHJ3bG9ja3MgZG9uJ3QgdGFrZSBwYXJ0IGluIHRoYXQgdHJhY2tpbmc6Cj4gPj4g
cXVldWVkX3JlYWRfdW5sb2NrKCkgaXNzdWVzIGp1c3QgImZlbmNlIHJ3LHciIGJlZm9yZSB0aGUg
QU1PLCB3aGljaAo+ID4+IGRvZXNuJ3Qgb3JkZXIgZGV2aWNlIG91dHB1dC4gU28gdGhlIFNFVElQ
TlVNIHdyaXRlIGNhbiBzdGlsbCBiZSBpbgo+ID4+IGZsaWdodCBhZnRlciBhbm90aGVyIGhhcnQg
aGFzIG9ic2VydmVkIHZzZmlsZV9sb2NrIGJlaW5nIHJlbGVhc2VkLiBJZgo+ID4+IHRoZSBvbGQg
VlMtZmlsZSBpcyByZWFkIGFuZCBjbGVhcmVkIGJlZm9yZSB0aGUgd3JpdGUgbGFuZHMsIHRoZQo+
ID4+IGludGVycnVwdCBpcyBsb3N0LiBJZiB0aGUgSEdFSSBsaW5lIGhhcyBhbHJlYWR5IGJlZW4g
aGFuZGVkIG91dAo+ID4+IGFnYWluLCB0aGUgaW50ZXJydXB0IGVuZHMgdXAgaW4gYW5vdGhlciB2
Q1BVJ3MgVlMtZmlsZS4KPiA+Pgo+ID4+IEFkZCBhbiBleHBsaWNpdCBSSVNDVl9GRU5DRShvLCB3
KSBhZnRlciB0aGUgd3JpdGUgdG8gdGhlIFZTLWZpbGUsIHdoaWNoCj4gPj4gaXMgd2hhdCBzcGlu
X3VubG9jaygpIHdvdWxkIGlzc3VlIHZpYSBtbWlvd2IoKS4KPiA+Pgo+ID4+IEZpeGVzOiBkYjhi
N2U5N2Q2MTMgKCJSSVNDLVY6IEtWTTogQWRkIGluLWtlcm5lbCB2aXJ0dWFsaXphdGlvbiBvZiBB
SUEgSU1TSUMiKQo+ID4+IFNpZ25lZC1vZmYtYnk6IE9sZWtzaWkgS3Vyb2Noa28gPG9sZWtzaWku
a3Vyb2Noa29AZ21haWwuY29tPgo+ID4+IC0tLQo+ID4+IFdoeSBSSVNDVl9GRU5DRShvLCB3KSBh
bmQgbm90IG1taW93YigpOgo+ID4+Cj4gPj4gLSBTaW5jZSB0aGUgbW1pb3diKCkgcmV3b3JrIGlu
IHY1LjIgKGUuZy4gY29tbWl0IDYwY2ExZTVhMjAwYwo+ID4+ICAgICgibW1pb3diOiBIb29rIHVw
IG1taW93YiBoZWxwZXJzIHRvIHNwaW5sb2NrcyBhbmQgZ2VuZXJpYyBJL08KPiA+PiAgICBhY2Nl
c3NvcnMiKSksIG1taW93YigpIGlzIGFuIGltcGxlbWVudGF0aW9uIGRldGFpbCBvZiB0aGUgc3Bp
bmxvY2sKPiA+PiAgICBjb2RlLiBFeHBsaWNpdCBpbnZvY2F0aW9ucyB3ZXJlIHJlbW92ZWQgZnJv
bSBkcml2ZXJzIGJ5IGNvbW1pdAo+ID4+ICAgIGZiMjRlYTUyZjc4ZSAoImRyaXZlcnM6IFJlbW92
ZSBleHBsaWNpdCBpbnZvY2F0aW9ucyBvZiBtbWlvd2IoKSIpIGFuZAo+ID4+ICAgIGZyb20gdGhl
IGRvY3VtZW50YXRpb24gYnkgY29tbWl0IDkxNTUzMDM5NmM3OCAoIkRvY3VtZW50YXRpb246IEtp
bGwKPiA+PiAgICBhbGwgcmVmZXJlbmNlcyB0byBtbWlvd2IoKSIpLCBzbyBhZGRpbmcgYSBuZXcg
ZGlyZWN0IGNhbGxlciB3b3VsZCBnbwo+ID4+ICAgIGFnYWluc3QgdGhhdC4KPiA+Pgo+ID4+IC0g
UklTQ1ZfRkVOQ0Uobywgdykgc3RhdGVzIGV4YWN0bHkgdGhlIG9yZGVyaW5nIG5lZWRlZCBoZXJl
IChkZXZpY2UKPiA+PiAgICBvdXRwdXQgYmVmb3JlIHRoZSBzdG9yZSB0aGF0IHJlbGVhc2VzIHRo
ZSBsb2NrKSwgd2hpY2ggaXMgZmluZSBmb3IKPiA+PiAgICBhcmNoLXNwZWNpZmljIGNvZGUsIGFu
ZCBpdCBpcyB0aGUgc2FtZSBpbnN0cnVjdGlvbiBtbWlvd2IoKSBleHBhbmRzIHRvCj4gPj4gICAg
b24gUklTQy1WLiB3bWIoKSAoImZlbmNlIG93LG93Iikgd291bGQgYWxzbyB3b3JrIGJ1dCBpcyBz
dHJvbmdlciB0aGFuCj4gPj4gICAgcmVxdWlyZWQuCj4gPj4KPiA+PiBTY29wZTogdGhpcyBvbmx5
IG9yZGVycyB0aGUgd3JpdGUgYmVmb3JlIHRoZSBsb2NrIHJlbGVhc2UuIFdoZXRoZXIgYQo+ID4+
IHdyaXRlIHRoYXQgaXMgYWxyZWFkeSBpbiBnbG9iYWwgbWVtb3J5IG9yZGVyIGlzIGd1YXJhbnRl
ZWQgdG8gaGF2ZQo+ID4+IHRha2VuIGVmZmVjdCBpbiB0aGUgb2xkIFZTLWZpbGUgYmVmb3JlIGt2
bV9yaXNjdl92Y3B1X2FpYV9pbXNpY191cGRhdGUoKQo+ID4+IG9yIGt2bV9yaXNjdl92Y3B1X2Fp
YV9pbXNpY19yZWxlYXNlKCkgcmVhZHMgYW5kIGNsZWFycyBpdCBpcyBhIHNlcGFyYXRlCj4gPj4g
cXVlc3Rpb24sIHNlZSBodHRwczovL2dpdGh1Yi5jb20vcmlzY3YvcmlzY3YtYWlhL2lzc3Vlcy8x
NzIuIElmIGl0Cj4gPj4gaXNuJ3QsIHRoZXNlIHBhdGhzIHdpbGwgYWxzbyBuZWVkIHRvIGRyYWlu
IHRoZSBvbGQgVlMtZmlsZSwgYW5kIHN1Y2ggYQo+ID4+IGRyYWluIGRlcGVuZHMgb24gdGhlIG9y
ZGVyaW5nIGFkZGVkIGhlcmUuCj4gPj4gLS0tCj4gPj4gICBhcmNoL3Jpc2N2L2t2bS9haWFfaW1z
aWMuYyB8IDcgKysrKysrKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+
ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jIGIvYXJjaC9y
aXNjdi9rdm0vYWlhX2ltc2ljLmMKPiA+PiBpbmRleCBmMTdkYzU1OWE3MDkuLjgwN2JiNzNhMTI5
YSAxMDA2NDQKPiA+PiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ID4+ICsrKyBi
L2FyY2gvcmlzY3Yva3ZtL2FpYV9pbXNpYy5jCj4gPj4gQEAgLTEwNTYsNiArMTA1NiwxMyBAQCBp
bnQga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2luamVjdChzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUs
Cj4gPj4KPiA+PiAgICAgICAgICBpZiAoaW1zaWMtPnZzZmlsZV9jcHUgPj0gMCkgewo+ID4+ICAg
ICAgICAgICAgICAgICAgd3JpdGVsKGlpZCwgaW1zaWMtPnZzZmlsZV92YSArIElNU0lDX01NSU9f
U0VUSVBOVU1fTEUpOwo+ID4+ICsgICAgICAgICAgICAgICAvKgo+ID4+ICsgICAgICAgICAgICAg
ICAgKiByd2xvY2tzIGRvbid0IHBhcnRpY2lwYXRlIGluIG1taW93YigpIHRyYWNraW5nLCBzbyBv
cmRlcgo+ID4+ICsgICAgICAgICAgICAgICAgKiB0aGUgd3JpdGUgdG8gdGhlIFZTLWZpbGUgYmVm
b3JlIHJlbGVhc2luZyB2c2ZpbGVfbG9jaywKPiA+PiArICAgICAgICAgICAgICAgICogaS5lLiBi
ZWZvcmUgdGhlIHZDUFUgY2FuIGJlIG1vdmVkIG9mZiB0aGlzIFZTLWZpbGUgYW5kCj4gPj4gKyAg
ICAgICAgICAgICAgICAqIHRoZSBWUy1maWxlIHJlYWQgYW5kIGNsZWFyZWQuCj4gPj4gKyAgICAg
ICAgICAgICAgICAqLwo+ID4+ICsgICAgICAgICAgICAgICBSSVNDVl9GRU5DRShvLCB3KTsKPiA+
Cj4gPiBBbm90aGVyIGZlbmNlIGFmdGVyIGV2ZXJ5IHdyaXRlbCgpIGlzIGEgYmlnIGhhbW1lciBp
biB0aGUgcGF0aC4KPiA+Cj4gPiBJZiB0aGUgaW50ZW50aW9uIGlzIHRvIGhhdmUgY29ycmVjdCBj
b250ZW50cyB3aGVuIFZTLWZpbGUgaXMgcmVhZCB0aGVuCj4gPiBiZXR0ZXIgcGxhY2UgdG8gYWRk
IGEgZmVuY2UgaXMgYXQgdGhlIHN0YXJ0IG9mIGltc2ljX3ZzZmlsZV9sb2NhbF9yZWFkKCkuCj4g
VGhhbmtzIGZvciB0aGUgcmV2aWV3Lgo+Cj4gSSBkb24ndCB0aGluayBhIGZlbmNlIGluIGltc2lj
X3ZzZmlsZV9sb2NhbF9yZWFkKCkgaGVscHMgaGVyZS4gVGhlCj4gcHJvYmxlbSBpcyBvbiB0aGUg
d3JpdGVyJ3Mgc2lkZSwgYW5kIGltc2ljX3ZzZmlsZV9sb2NhbF9yZWFkKCkgcnVucyBvbgo+IGEg
ZGlmZmVyZW50IGhhcnQuCj4KPiBUaGUgU0VUSVBOVU0gd3JpdGUgaXMgZG9uZSBieSB3aGljaGV2
ZXIgaGFydCBjYWxscwo+IGt2bV9yaXNjdl92Y3B1X2FpYV9pbXNpY19pbmplY3QoKSwgd2hpY2gg
Y2FuIGJlIGFueSBDUFUgKGlycWZkLAo+IGlvY3RsLCAuLi4pLiBpbXNpY192c2ZpbGVfbG9jYWxf
cmVhZCgpIHJ1bnMgb24gdGhlIG9sZCB2c2ZpbGVfY3B1LCB2aWEKPiB0aGUgSVBJIGZyb20gaW1z
aWNfdnNmaWxlX3JlYWQoKS4gQSBmZW5jZSBvbmx5IG9yZGVycyB0aGUgYWNjZXNzZXMgb2YKPiB0
aGUgaGFydCB0aGF0IGV4ZWN1dGVzIGl0LCBzbyBhIGZlbmNlIG9uIHRoZSByZWFkaW5nIGhhcnQg
Y2FuJ3QgbWFrZQo+IGFub3RoZXIgaGFydCdzIE1NSU8gc3RvcmUgbGFuZC4KPgo+IFdpdGhvdXQg
dGhlIGZlbmNlLCB0aGlzIGNhbiBoYXBwZW46Cj4KPiAgICBoYXJ0IEEgKGluamVjdCkgICAgICAg
ICAgICBoYXJ0IEIgKHVwZGF0ZS9yZWxlYXNlKSAgICBoYXJ0IEMgKG9sZAo+IHZzZmlsZV9jcHUp
Cj4gICAgcmVhZF9sb2NrKCkKPiAgICB3cml0ZWwoU0VUSVBOVU0pCj4gICAgICAoc3RvcmUgc3Rp
bGwgaW4gZmxpZ2h0KQoKT3ZlciBoZXJlIHRoZSBNTUlPIHdyaXRlIHRhcmdldHMgaGFydCBDIElN
U0lDCgo+ICAgIHJlYWRfdW5sb2NrKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3
cml0ZV9sb2NrKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2ggVlMtZmls
ZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlX3VubG9jaygpCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgSVBJIC0tLS0tLS0tLS0tLS0tLS0tLS0+Cj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmZW5jZSAg
PC1wcm9wb3NlZAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgcmVhZCtjbGVhciBWU2ZpbGUKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBmcmVlIEhHRUkKPiAgICBTRVRJUE5VTSBsYW5kczogdGhlIGludGVycnVwdAo+ICAgIGlz
IGxvc3QsIG9yIGVuZHMgdXAgaW4gYW5vdGhlcgo+ICAgIHZDUFUncyBWUy1maWxlIGlmIHRoZSBI
R0VJIHdhcwo+ICAgIGFscmVhZHkgcmV1c2VkCj4KPiBIYXJ0IEEncyB1bmxvY2sgY2FuIGJlY29t
ZSB2aXNpYmxlIGJlZm9yZSBpdHMgU0VUSVBOVU0gd3JpdGUgaGFzCj4gcmVhY2hlZCB0aGUgSU1T
SUMsIGJlY2F1c2UgcmVhZF91bmxvY2soKSBkb2Vzbid0IG9yZGVyIGRldmljZSBvdXRwdXQuCj4g
Tm90aGluZyB0aGF0IGhhcnQgQiBvciBoYXJ0IEMgZG9lcyBhZnRlcndhcmRzIGNhbiB3YWl0IGZv
ciB0aGF0IHdyaXRlLgo+IE9ubHkgaGFydCBBIGNhbiBob2xkIGJhY2sgaXRzIHVubG9jayB1bnRp
bCB0aGUgd3JpdGUgaXMgb3JkZXJlZCwgYW5kCj4gdGhhdCBpcyB3aGF0IHRoZSBmZW5jZSBvLHcg
YWZ0ZXIgd3JpdGVsKCkgZG9lcy4KPgo+IFdpdGggdGhlIGZlbmNlOgo+Cj4gICAgaGFydCBBIChp
bmplY3QpICAgICAgICAgICAgaGFydCBCICh1cGRhdGUvcmVsZWFzZSkgICAgaGFydCBDIChvbGQK
PiB2c2ZpbGVfY3B1KQo+ICAgIHJlYWRfbG9jaygpCj4gICAgd3JpdGVsKFNFVElQTlVNKQo+ICAg
IGZlbmNlIG8sdwo+ICAgIHJlYWRfdW5sb2NrKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB3cml0ZV9sb2NrKCkKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzd2l0Y2gg
VlMtZmlsZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHdyaXRlX3VubG9jaygpCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgSVBJIC0tLS0tLS0tLS0tLS0tLS0tLS0+Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJl
YWQrY2xlYXIgVlMtZmlsZQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGZyZWUgSEdF
SQo+Cj4gVGhlIFNFVElQTlVNIHdyaXRlIGlzIG5vdyBvcmRlcmVkIGJlZm9yZSB0aGUgdW5sb2Nr
LCBzbyBpdCBpcyBhbHNvCj4gb3JkZXJlZCBiZWZvcmUgZXZlcnl0aGluZyBoYXJ0IEIgZG9lcyBh
ZnRlciB0YWtpbmcgdGhlIGxvY2ssIGFuZCwKPiB0aHJvdWdoIHRoZSBJUEksIGJlZm9yZSBoYXJ0
IEMgcmVhZHMgdGhlIG9sZCBWUy1maWxlLiBJdCBjYW4gbm8gbG9uZ2VyCj4gYXJyaXZlIGFmdGVy
IHRoZSByZWFkIG9yIGFmdGVyIHRoZSBIR0VJIGlzIGZyZWVkLgo+Cj4gQWJvdXQgdGhlIGNvc3Q6
IHRoaXMgaXMgdGhlIHNhbWUgZmVuY2UgdGhhdCBldmVyeSB3cml0ZWwoKSB1bmRlciBhCj4gc3Bp
bmxvY2sgYWxyZWFkeSBnZXRzLiBPbiBSSVNDLVYsIHdyaXRlbCgpIG9ubHkgc2V0cyBtbWlvd2Ig
cGVuZGluZyBhbmQKPiBzcGluX3VubG9jaygpIHRoZW4gaXNzdWVzICJmZW5jZSBvLHciLiBXZSBu
ZWVkIGl0IGV4cGxpY2l0bHkgaGVyZSBvbmx5Cj4gYmVjYXVzZSB2c2ZpbGVfbG9jayBpcyBhbiBy
d2xvY2suIEl0IHJ1bnMgb25jZSBwZXIgaW5qZWN0ZWQgTVNJLCBhbmQKPiBvbmx5IHdoZW4gdGhl
IHZDUFUgaGFzIGEgVlMtZmlsZS4KCkkgYW0gc3RpbGwgbm90IG9uLWJvYXJkIGFkZGluZyBhIGJh
cnJpZXIgaW4gaG90LXBhdGguIEFsc28sIGFueSBiYXJyaWVyCndlIGFkZCBtdXN0IGJlIHBhaXJl
ZCB3aXRoIGEgYmFycmllciBlbHNlIHdoZXJlIHdpdGggcHJvcGVyIGNvbW1lbnRzCnNvIHRoaXMg
c2luZ2xlIGJhcnJpZXIgYW55d2F5cyBkb2VzIG5vdCBzYXRpZnkgdGhpcyByZXF1aXJlbWVudC4K
Ckluc3RlYWQgb2YgdGhpcywgSSB0aGluayBhIG11Y2ggY2xlYW5lciBhcHByb2FjaCBpcyB0byBj
b252ZXJ0IHZzZmlsZV9sb2NrCnRvIHJhd19zcGlubG9ja190LiBUaGUgY3VycmVudCB2c2ZpbGVf
bG9jayBiZWluZyBhIHJ3bG9ja190IGlzIGNyZWF0ZSBvdGhlcgppc3N1ZXMgYXMgd2VsbCBbMV0u
IFRoaXMgd2lsbCBhbHNvIGFsbG93IHVzIHRvIHVzZSB3cml0ZWxfcmVsYXhlZCgpIGluIHRoZQpr
dm1fcmlzY3ZfdmNwdV9haWFfaW1zaWNfaW5qZWN0KCkgc2luY2UgcmF3X3NwaW5fdW5sb2NrKCkg
d2lsbCB0YWtlCmNhcmUgb2YgZHJhaW5pbmcgdGhlIHdyaXRlIGJ1ZmZlci4KCkkgd2lsbCBwb3N0
IHNvbWV0aGluZyBhbG9uZyB0aGVzZSBsaW5lcy4KClJlZ2FyZHMsCkFudXAKClsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9yLzIwMjYwOTI1MTU1MTE2LjQ2NTIwMy0xLWFuZHJldy5qb25lc0Bv
c3MucXVhbGNvbW0uY29tCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
