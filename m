Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059BFC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Jun 2023 04:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PL4Dn0jdim7bTIspBkopSylRHivwAUjc1vO94SgbglI=; b=CQoCiOnKDGWtfh
	xbTsgGZ9NH6HOCo9ktuz//i5GwbnAMbagXUhh/PZgPw27rRsnjmklGCpjoTeKUS3R31bHNW22p+Nj
	yqlyWN+oAznu1esJlHlqyrcjdgruEWyfGVhQ+rEQgFyu2M55vb/4jQZ9Obkzt5ZQtu7GMnSKVmaa/
	6YoMVIQ5i9ZsDoiXh5B9JxrOhUsX4kDBv1Rttck+16khlFFKbDn/G2GW4poEs1V8lxNhb38ojOlAE
	ePpHOrFXLVnbUPa+/CdZMEh7Omge189dR1DoiUahAE+gqAKK8OmXKwG4JNdZX9NXS++AvNB89C5nq
	WHTSEpDyxXRreqtkKF9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4aCi-001x13-2j;
	Thu, 01 Jun 2023 04:46:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4aCg-001x0I-09;
	Thu, 01 Jun 2023 04:46:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6B310640BC;
	Thu,  1 Jun 2023 04:46:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E07AC433AA;
	Thu,  1 Jun 2023 04:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685594784;
	bh=6PWxODOB5BjJ2+hJ5LQ+k3DS3JqdXw0tvj806HzZMps=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Yg/wTLmoK7DBqYcnP3Ib0Ubd2VVoLae5benlTL7SnxKl2HyMf/Ro2UPNqMeKpxLJM
	 KGlPOhY74cfdb7OPK7avVi3sBBWkiHEbUaMrGkluhprhI+xzIiE5itSxNrmzKuvmtX
	 vT8RiVkoNBSKlOD9Pd8bXptM18oBCMpcGRoXPqReaYdIfwFL4aV4HtKft8hQWWEOHq
	 mSXa+UI+elzU9QxhVJfL5hZxxdg48sRH2u8BR5vtOuvfJ1O7nOiNk+Sz9GY89Q04y9
	 fYKHQz5VeEXwbj7VUwpgrR7US6h2XC+kE+AUftl4vM6La6fu8jsN0L6JHonvoW4F7Q
	 6w0Z6pfvbddow==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-4f4d6aee530so321377e87.2;
        Wed, 31 May 2023 21:46:24 -0700 (PDT)
X-Gm-Message-State: AC+VfDxg+itG2aHC51oc58jowgRd85tY9uvHeOo9itu1MxzuWK0k+6XZ
	JWtlgS3xW1rmq/fkXdpq1s6HT+JDOspbWEwNFQo=
X-Google-Smtp-Source: ACHHUZ7N6vBdj6gVyW7L8xDyB9SffvV07lFwdCsIsM3G5zOmwiFyTLV/4LGBiFc+iJJEUBO/+74+cgsZzpD1eAuWtPE=
X-Received: by 2002:ac2:4c14:0:b0:4eb:42b7:8c18 with SMTP id
 t20-20020ac24c14000000b004eb42b78c18mr594264lfq.53.1685594782235; Wed, 31 May
 2023 21:46:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230518161949.11203-1-andy.chiu@sifive.com> <20230518161949.11203-4-andy.chiu@sifive.com>
In-Reply-To: <20230518161949.11203-4-andy.chiu@sifive.com>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 1 Jun 2023 12:46:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRpTdXeDXczaVCmZdd0fNQADBPpd3+VMnYsd+XcudHSXg@mail.gmail.com>
Message-ID: <CAJF2gTRpTdXeDXczaVCmZdd0fNQADBPpd3+VMnYsd+XcudHSXg@mail.gmail.com>
Subject: Re: [PATCH -next v20 03/26] riscv: hwprobe: Add support for probing V
 in RISCV_HWPROBE_KEY_IMA_EXT_0
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, anup@brainfault.org, 
	atishp@atishpatra.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	vineetg@rivosinc.com, greentime.hu@sifive.com, guoren@linux.alibaba.com, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko.stuebner@vrull.eu>, 
	Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Andrew Bresticker <abrestic@rivosinc.com>, 
	Celeste Liu <coelacanthus@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_214626_179010_5DA93512 
X-CRM114-Status: GOOD (  20.89  )
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

T24gRnJpLCBNYXkgMTksIDIwMjMgYXQgMTI6MjDigK9BTSBBbmR5IENoaXUgPGFuZHkuY2hpdUBz
aWZpdmUuY29tPiB3cm90ZToKPgo+IFByb2Jpbmcga2VybmVsIHN1cHBvcnQgZm9yIFZlY3RvciBl
eHRlbnNpb24gaXMgYXZhaWxhYmxlIG5vdy4gVGhpcyBvbmx5Cj4gYWRkIGRldGVjdGlvbiBmb3Ig
ViBvbmx5LiBFeHRlbmlvbnMgbGlrZSBadmZoLCBaayBhcmUgbm90IGluIHRoaXMgc2NvcGUuCj4K
PiBTaWduZWQtb2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgpSZXZpZXdl
ZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cgo+IC0tLQo+IENoYW5nZWxvZyB2MjA6
Cj4gIC0gRml4IGEgdHlwbyBpbiBkb2N1bWVudCwgYW5kIHJlbW92ZSBkdXBsaWNhdGVkIHByb2Jl
cyAoSGVpa28pCj4gIC0gcHJvYmUgViBleHRlbnNpb24gaW4gUklTQ1ZfSFdQUk9CRV9LRVlfSU1B
X0VYVF8wIGtleSBvbmx5IChQYWxtZXIsCj4gICAgRXZhbikKPiAtLS0KPiAgRG9jdW1lbnRhdGlv
bi9yaXNjdi9od3Byb2JlLnJzdCAgICAgICB8IDMgKysrCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmggfCAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMg
ICAgICAgICB8IDQgKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QgYi9Eb2N1bWVudGF0
aW9uL3Jpc2N2L2h3cHJvYmUucnN0Cj4gaW5kZXggOWYwZGQ2MmRjYjVkLi43NDMxZDlkMDFjNzMg
MTAwNjQ0Cj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9yaXNjdi9od3Byb2JlLnJzdAo+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vcmlzY3YvaHdwcm9iZS5yc3QKPiBAQCAtNjQsNiArNjQsOSBAQCBUaGUgZm9s
bG93aW5nIGtleXMgYXJlIGRlZmluZWQ6Cj4gICAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9J
TUFfQ2A6IFRoZSBDIGV4dGVuc2lvbiBpcyBzdXBwb3J0ZWQsIGFzIGRlZmluZWQKPiAgICAgIGJ5
IHZlcnNpb24gMi4yIG9mIHRoZSBSSVNDLVYgSVNBIG1hbnVhbC4KPgo+ICsgICogOmM6bWFjcm86
YFJJU0NWX0hXUFJPQkVfSU1BX1ZgOiBUaGUgViBleHRlbnNpb24gaXMgc3VwcG9ydGVkLCBhcyBk
ZWZpbmVkIGJ5Cj4gKyAgICB2ZXJzaW9uIDEuMCBvZiB0aGUgUklTQy1WIFZlY3RvciBleHRlbnNp
b24gbWFudWFsLgo+ICsKPiAgKiA6YzptYWNybzpgUklTQ1ZfSFdQUk9CRV9LRVlfQ1BVUEVSRl8w
YDogQSBiaXRtYXNrIHRoYXQgY29udGFpbnMgcGVyZm9ybWFuY2UKPiAgICBpbmZvcm1hdGlvbiBh
Ym91dCB0aGUgc2VsZWN0ZWQgc2V0IG9mIHByb2Nlc3NvcnMuCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS91
YXBpL2FzbS9od3Byb2JlLmgKPiBpbmRleCA4ZDc0NWE0YWQ4YTIuLjdjNmZkY2Y3Y2VkNSAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vaHdwcm9iZS5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL3VhcGkvYXNtL2h3cHJvYmUuaAo+IEBAIC0yNSw2ICsyNSw3IEBA
IHN0cnVjdCByaXNjdl9od3Byb2JlIHsKPiAgI2RlZmluZSBSSVNDVl9IV1BST0JFX0tFWV9JTUFf
RVhUXzAgICAgNAo+ICAjZGVmaW5lICAgICAgICAgICAgICAgIFJJU0NWX0hXUFJPQkVfSU1BX0ZE
ICAgICAgICAgICAgKDEgPDwgMCkKPiAgI2RlZmluZSAgICAgICAgICAgICAgICBSSVNDVl9IV1BS
T0JFX0lNQV9DICAgICAgICAgICAgICgxIDw8IDEpCj4gKyNkZWZpbmUgICAgICAgICAgICAgICAg
UklTQ1ZfSFdQUk9CRV9JTUFfViAgICAgICAgICAgICAoMSA8PCAyKQo+ICAjZGVmaW5lIFJJU0NW
X0hXUFJPQkVfS0VZX0NQVVBFUkZfMCAgICA1Cj4gICNkZWZpbmUgICAgICAgICAgICAgICAgUklT
Q1ZfSFdQUk9CRV9NSVNBTElHTkVEX1VOS05PV04gICAgICAgICgwIDw8IDApCj4gICNkZWZpbmUg
ICAgICAgICAgICAgICAgUklTQ1ZfSFdQUk9CRV9NSVNBTElHTkVEX0VNVUxBVEVEICAgICAgICgx
IDw8IDApCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvc3lzX3Jpc2N2LmMKPiBpbmRleCA1ZGIyOTY4M2ViZWUuLjg4MzU3YTg0
ODc5NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9zeXNfcmlzY3YuYwo+ICsrKyBi
L2FyY2gvcmlzY3Yva2VybmVsL3N5c19yaXNjdi5jCj4gQEAgLTEwLDYgKzEwLDcgQEAKPiAgI2lu
Y2x1ZGUgPGFzbS9jcHVmZWF0dXJlLmg+Cj4gICNpbmNsdWRlIDxhc20vaHdwcm9iZS5oPgo+ICAj
aW5jbHVkZSA8YXNtL3NiaS5oPgo+ICsjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+ICAjaW5jbHVk
ZSA8YXNtL3N3aXRjaF90by5oPgo+ICAjaW5jbHVkZSA8YXNtL3VhY2Nlc3MuaD4KPiAgI2luY2x1
ZGUgPGFzbS91bmlzdGQuaD4KPiBAQCAtMTcxLDYgKzE3Miw5IEBAIHN0YXRpYyB2b2lkIGh3cHJv
YmVfb25lX3BhaXIoc3RydWN0IHJpc2N2X2h3cHJvYmUgKnBhaXIsCj4gICAgICAgICAgICAgICAg
IGlmIChyaXNjdl9pc2FfZXh0ZW5zaW9uX2F2YWlsYWJsZShOVUxMLCBjKSkKPiAgICAgICAgICAg
ICAgICAgICAgICAgICBwYWlyLT52YWx1ZSB8PSBSSVNDVl9IV1BST0JFX0lNQV9DOwo+Cj4gKyAg
ICAgICAgICAgICAgIGlmIChoYXNfdmVjdG9yKCkpCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
cGFpci0+dmFsdWUgfD0gUklTQ1ZfSFdQUk9CRV9JTUFfVjsKPiArCj4gICAgICAgICAgICAgICAg
IGJyZWFrOwo+Cj4gICAgICAgICBjYXNlIFJJU0NWX0hXUFJPQkVfS0VZX0NQVVBFUkZfMDoKPiAt
LQo+IDIuMTcuMQo+CgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
