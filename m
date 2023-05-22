Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15C5C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 22 May 2023 04:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wYBExmjW26cHWLeezdMtIVDCNfdJHnjipZqqHZcwdAw=; b=tLOReJXZUBVLJ7
	B78Z45ULUTXiUCey2gIPQCGrP6La1ycLmPjJMts7kf7J2XiX6qSe4TTQRnSnjH6vqOb/qZZJVHL0o
	4H8kYhnRKW57OoUGUtq6UOmllXPaNnIWCr9OFC6YGn7bDjIbPoMe6ejoFA6C93SORqBdVCAunLbNY
	Onpz1MTXSdyf9FaiccGQ6ka/ENzY3tfXuV51TrwSVRBOyXqPaeCxftirQshioXQIn+dmv/B7DIWCo
	wi3Xb4qy9sFs7ad6vo1Ks8gA7Qo+QWm10OFB9NgT2yUQ0r7ZQFpiSwZl8nYoR6QWZNpAeXAcvXM2u
	YsX6HhkSoGimFT9dt5cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0x1F-005Hjv-32;
	Mon, 22 May 2023 04:19:37 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0x1D-005HiC-2B
	for linux-riscv@lists.infradead.org;
	Mon, 22 May 2023 04:19:36 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-510ddeab704so7132837a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 May 2023 21:19:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20221208.gappssmtp.com; s=20221208; t=1684729171; x=1687321171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k6R0fGdLfiHWfeeg/+UnqTOnxxWH1sRAWs2bXSs9TBw=;
        b=AMrduyX6ySJBNshvdWqmfu1vyyl7oisPkSgZ/EhcHcuD5cllHjjy//BlgByXaKeW1p
         b0CUwgUOYZQw6IWByrHcYKERB6Kd9eeTHUTcrBJnNwo3fkode1Ki4a+DC8eGm7IU0Xd5
         /Z4QCDbSx/FtmdhzLt8VA7dFo5iV0j/2NMU/gTyayjWTxVOknF9OaUiqI6zCPIza/99d
         ughlcDI1Y6ppCWcw7IetQxslk95u1qC9v6zg3lrtzCZJwL1woJwsEV6wi7vWhW0GS6+X
         q7SrRFVdGTZlKEkFtiNijvCFqbR4zXyJRgHmf6HGEtpFgw3FAPLsob2yV6tRtaJImeBz
         a70A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684729171; x=1687321171;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k6R0fGdLfiHWfeeg/+UnqTOnxxWH1sRAWs2bXSs9TBw=;
        b=ZgcavFnXRkVDyg9yKsF9/zGCsxeT9OJyC6S8MBs1VdqZkSj3WRS29F/Dvwh9r1pcKv
         XtMeuHUKBc46+76hddjR3YzF+Ep83pqc/f+znOmca5RLnIRe5Of7dCNPmfn5NWsD8xVI
         MPz3Nt10fpjo4ZQqbalPBSAwZ9V5rVUj/EDEiC0mYYrduLuUCJ2sry10+2BfNSqa+BZC
         fZJ6j9dQeyodg4v2X+lm7JlgI+JmnP5UlifHn6TE2XnZFiFf62NC9rh3ILKGIeLbzG1j
         phT30lL7VbVrFWx2jWObPU8LhfaqkCAhdIwSEVSCHFO9CkfokAvPyLhiQjV/x/AKDpU1
         KxlQ==
X-Gm-Message-State: AC+VfDz77wyfNiOTqvBGTjBCCdoks1ikKE+GfKQ18f+rryNxlh9foodR
	vn0B2hX+WNJsNNrvY2IbkTMT1ctQxkyIgvFI+SPeHQ==
X-Google-Smtp-Source: ACHHUZ7NgkgksygczrfupwMkXnUqAluuVB0P7LKIp1C0lMYIW/KgaJuQIBHrgYroxsmbFQbE/bffLHrweqg6g02WL+M=
X-Received: by 2002:a05:6402:b0f:b0:50b:f8f7:f8d8 with SMTP id
 bm15-20020a0564020b0f00b0050bf8f7f8d8mr7003523edb.36.1684729171031; Sun, 21
 May 2023 21:19:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230520150116.7451-1-waylingII@gmail.com>
In-Reply-To: <20230520150116.7451-1-waylingII@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 May 2023 09:49:19 +0530
Message-ID: <CAAhSdy0Z+YRPQLQ-PXmrHCTYpAqi+NBV-uJquBxYdMt55SRdZg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Redirect AMO load/store misaligned traps to guest
To: wchen <waylingii@gmail.com>
Cc: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, ajones@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230521_211935_712747_1400B65E 
X-CRM114-Status: GOOD (  16.52  )
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

T24gU2F0LCBNYXkgMjAsIDIwMjMgYXQgODozMeKAr1BNIHdjaGVuIDx3YXlsaW5naWlAZ21haWwu
Y29tPiB3cm90ZToKPgo+IFRoZSBNLW1vZGUgcmVkaXJlY3RzIGFuIHVuaGFuZGxlZCBtaXNhbGln
bmVkIHRyYXAgYmFjawo+IHRvIFMtbW9kZSB3aGVuIG5vdCBkZWxlZ2F0aW5nIGl0IHRvIFZTLW1v
ZGUoaGVkZWxlZykuCj4gSG93ZXZlciwgS1ZNIHJ1bm5pbmcgaW4gSFMtbW9kZSB0ZXJtaW5hdGVz
IHRoZSBWUy1tb2RlCj4gc29mdHdhcmUgd2hlbiBiYWNrIGZyb20gTS1tb2RlLgo+IFRoZSBLVk0g
c2hvdWxkIHJlZGlyZWN0IHRoZSB0cmFwIGJhY2sgdG8gVlMtbW9kZSwgYW5kCj4gbGV0IFZTLW1v
ZGUgdHJhcCBoYW5kbGVyIGRlY2lkZSB0aGUgbmV4dCBzdGVwLgo+IEhlcmUgaXMgYSB3YXkgdG8g
aGFuZGxlIG1pc2FsaWduZWQgdHJhcHMgaW4gS1ZNLAo+IG5vdCBvbmx5IGRpcmVjdGluZyB0aGVt
IHRvIFZTLW1vZGUgb3IgdGVybWluYXRlIGl0Lgo+Cj4gU2lnbmVkLW9mZi1ieTogd2NoZW4gPHdh
eWxpbmdJSUBnbWFpbC5jb20+CgpMb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IEFudXAg
UGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpSZWdhcmRzLApBbnVwCgo+IC0tLQo+ICBhcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgMiArKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1X2V4
aXQuYyAgIHwgMiArKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmggYi9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL2Nzci5oCj4gaW5kZXggYjZhY2I3ZWQxLi45MTc4MTRhMGYgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vY3NyLmgKPiBAQCAtODIsNyArODIsOSBAQAo+ICAjZGVmaW5lIEVYQ19JTlNUX0FDQ0VTUyAg
ICAgICAgICAgICAgICAxCj4gICNkZWZpbmUgRVhDX0lOU1RfSUxMRUdBTCAgICAgICAyCj4gICNk
ZWZpbmUgRVhDX0JSRUFLUE9JTlQgICAgICAgICAzCj4gKyNkZWZpbmUgRVhDX0xPQURfTUlTQUxJ
R05FRCAgICA0Cj4gICNkZWZpbmUgRVhDX0xPQURfQUNDRVNTICAgICAgICAgICAgICAgIDUKPiAr
I2RlZmluZSBFWENfU1RPUkVfTUlTQUxJR05FRCAgIDYKPiAgI2RlZmluZSBFWENfU1RPUkVfQUND
RVNTICAgICAgIDcKPiAgI2RlZmluZSBFWENfU1lTQ0FMTCAgICAgICAgICAgIDgKPiAgI2RlZmlu
ZSBFWENfSFlQRVJWSVNPUl9TWVNDQUxMIDkKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0v
dmNwdV9leGl0LmMgYi9hcmNoL3Jpc2N2L2t2bS92Y3B1X2V4aXQuYwo+IGluZGV4IDRlYTEwMWE3
My4uMjQxNTcyMmMwIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfZXhpdC5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9leGl0LmMKPiBAQCAtMTgzLDYgKzE4Myw4IEBAIGlu
dCBrdm1fcmlzY3ZfdmNwdV9leGl0KHN0cnVjdCBrdm1fdmNwdSAqdmNwdSwgc3RydWN0IGt2bV9y
dW4gKnJ1biwKPiAgICAgICAgIHJ1bi0+ZXhpdF9yZWFzb24gPSBLVk1fRVhJVF9VTktOT1dOOwo+
ICAgICAgICAgc3dpdGNoICh0cmFwLT5zY2F1c2UpIHsKPiAgICAgICAgIGNhc2UgRVhDX0lOU1Rf
SUxMRUdBTDoKPiArICAgICAgIGNhc2UgRVhDX0xPQURfTUlTQUxJR05FRDoKPiArICAgICAgIGNh
c2UgRVhDX1NUT1JFX01JU0FMSUdORUQ6Cj4gICAgICAgICAgICAgICAgIGlmICh2Y3B1LT5hcmNo
Lmd1ZXN0X2NvbnRleHQuaHN0YXR1cyAmIEhTVEFUVVNfU1BWKSB7Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAga3ZtX3Jpc2N2X3ZjcHVfdHJhcF9yZWRpcmVjdCh2Y3B1LCB0cmFwKTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICByZXQgPSAxOwo+IC0tCj4gMi4zNC4xCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
