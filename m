Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62D4FCD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 16:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJzzaEHbyPBFuixbhP/HflOH2XP0ELDlRD6eT1CiUfk=; b=xNmVRkDsKn4DjR
	SBYhkVDouOv2tAnEjWsJxo7LUFgLOfoj+FrqJkaA557kRRznd35Mh1etsVmpEgk4DCXqGFO4bJCbx
	VvhyXjkC8Ofy+nCijSGDQE/nPdn2b1RwI+qCcVitm2xlel+ldIOuyXktrMQrzppyv/CVa+WcW5IDm
	oPVodPu7/1ZqaogYHn1xt/7/57JLjELBHiVzWjD/RiV5hglYN+O7dIykeZfxMJPzBB9pM8C87JQnu
	yKcxNRGRB2EPh+X5MhKPWkTeMsZBBtRFFsNqlBRbC98bR1UJb6L446PzhRiyg8lGnnkgj5mzrD5mL
	stP+mYrao+i2isgov98g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVX9k-00000000tE5-1vgL;
	Fri, 05 Jun 2026 16:12:24 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVX9g-00000000tCB-2fqI
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 16:12:23 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-8cce22e029cso39810906d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 05 Jun 2026 09:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780675939; cv=none;
        d=google.com; s=arc-20240605;
        b=g1GpmzlN7s28suFYdDsGUNuyTe+8rmvVPFHndSrMG5JsGNwoI3ty7zN9q+4G5NDxGg
         0xOUmpCKqdT8zsz2JlrR5HT0dJH3CX1XdRrS/QONQnd9DRJyq130BiJAdbMhBm3Zzx16
         d3t1X5y/KptblDiuYJ8vc4HspVvx2rgivZfwwV+asT68ZDRUM+1x0ID5gXnGm/7PruCL
         46I4FYKndVDcjXqMQbjNDpoB4UET4to1Khz8UY5tO/t3DIMwG4tG6yMDVakO6/CpSuiI
         hf74/0ZUOaPhi8ZpZ7p6VxAaGL0YSYqH6u+aBrEOj6RWhz9DPGb58FFqONdnbbVDHDY+
         QSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xPaw6mSt+SZ0+7hkZ5t+m28KWYkm5UvxnSOV1wRbNvc=;
        fh=OR3s5FPfCb7AvBMvKaOFMjqQ/g9u0BTjWyGOZnIn5Zo=;
        b=jw9ZX7sLgbC03oNXOKyGkLbgGi7hJmeV93b6XqWjFrg3xcfIWT+u0NOVK3XHWPP+yx
         FRKxQ73/uZDODMHlE6ssuai7/Oik8jiezqiakV+lxfrJWY89P9uKHei1gdgWjpq6cbU7
         M6tt2jvZdSSw+cPeeoJ4hIpf1WxO50+Hvq4XetYJabb15awDHDSby+Wp28tREZNpMhw8
         hoqwWqjl+LsQQbLNEImPqXJPJgRAqb7fK6nJtVN7S6N/OUfCcSy+i2A3+NIpj0osit8D
         KPDYaOR1bM6vZ+Q7DR81p1+u9IxC+rQQtmewjzv+IxtHUEAvnz/t7rK8PMCElrHuJHk7
         hnOA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780675939; x=1781280739; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xPaw6mSt+SZ0+7hkZ5t+m28KWYkm5UvxnSOV1wRbNvc=;
        b=SbqRaS4yjxs/hLvCuRIEAhBxA8eAZMXOIx3nrcfU649k3x6CNrS5xjPe/PSOw89JpF
         3oOyyKZ2Pw5RIEdR7CTcSW4gG8/ogExbbSZqvVCmA5RZ7V3hlQDNDiKaoxr98FokPtLB
         gO3EPtwgY7l9tcp10kS2MlTve3/uXnajmCHhCdvk0IR5y4Fj0OG0FC2OEsevrK5J5Pom
         cN2AtzRegtwL/UIXr8MY8Zv2y+VmDqa7BR44bfwG2PF9tpfdrNbr8bLaLtblwppjizhA
         nuEtu4frDQFT3UiNrQrfz5LWorYO7YI23ip8ulOD18mCm4KtSbeS8rbZFsJCzGVWu7Kk
         3HZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780675939; x=1781280739;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xPaw6mSt+SZ0+7hkZ5t+m28KWYkm5UvxnSOV1wRbNvc=;
        b=keRXF1yF/fnQh0lFaB13k2Lm3IT0/YlCc2rwbfBisE+AKJwbPhYnmQz7HFdOvxPdmE
         MPnX9yZumGX9zVE+VXUur/bjMB3TQQxuu1oriTW09b5bhw+gyJza40YjWPbmNsHmxN84
         +R1aflUxuKyPhLQp33V5lrAeRZUObnItnvIMsucK51zDFgzN9OaZgvkbiN2LfDe8hdYh
         +kzZ/7xELzIBe3GpE5ptAUX2Be1tsihM95qoyJFigLQ9Y8kOPonjIMGQwYwBB3hwDZ/G
         07QiT2FP5gyTIz6M8Gsryd1xULRO6D9m20AiI+D0ghxzP61Y2JU7VYDF13T9781u3QRm
         fUww==
X-Forwarded-Encrypted: i=1; AFNElJ+bjhU4SF/+EOiGWcuq0Ntxzb86ket785SnPfeEYRc561WsYyGfWY8N9zg7EYT8/KoZnaSewgeOqx6nsA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzD/IHJbjbePtiVUORylFSnPRyRqEcM4apZz/1gIPS+GwxfPjst
	RSTZCm42m+ot1A6un+QyzMH2knk02pzaiT85O51sk8Xz7kVez6fsBNkyS1yaMuDwyBs87D485NL
	7NFYSYSikkdDkHt0TaJA0aVRaM8A+O4bwYBlFLNmWVg==
X-Gm-Gg: Acq92OG9B8tgLb/vZPH6GswvArZWaQ+Sk4kZm4ZacD3BNpAey8b1309PNRWJesRgiiL
	mkwUxRfuwjqyDmkzk5Imt4rZxg5kxXuVDt9sGdj2H2Wza72yt5XBuW3FeKPcDU3anN3261Dl5N8
	HuIfFLFTzqq5P/fmVq7jp7Chq0d2AWhrwsnwJD0aNnF1ijCYN/O1VblZ3RSvpC6i1kH/zCje5YX
	ol2bk7ibvH5jgFdkdaO+N132F6FylkD7cL+VyJyp+kN3+30JF4cs6c5haD64xLhvCrEvDEI6r1U
	3of05QkF42beCeVij6xnTfA0N5DS3FA90VXOZGs4eVptCrvAXb4CS46pnGehvPVVBIrTK8Aoy58
	M5QJOjPnP/lWDyqjlziGK96GH/7uSjOZzx13h
X-Received: by 2002:a05:622a:1144:b0:50f:c403:7ffb with SMTP id
 d75a77b69052e-517987acbbcmr40203221cf.18.1780675939140; Fri, 05 Jun 2026
 09:12:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260601-kvm-get_reg_list-v2-v5-0-415d08a2813b@sifive.com> <20260601-kvm-get_reg_list-v2-v5-3-415d08a2813b@sifive.com>
In-Reply-To: <20260601-kvm-get_reg_list-v2-v5-3-415d08a2813b@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 5 Jun 2026 21:42:07 +0530
X-Gm-Features: AVHnY4Jd3LwHzYiVtfabtRsTfsG1iw3bev0LUzu4pHEM1i3Lnky8Ia0dxnf5nH8
Message-ID: <CAAhSdy25VTfezS2zUsuTCTZ+Bwie7c-oHQYOWod1ix1y5rWOWQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/5] KVM: RISC-V: SBI FWFT: Fix stale feature exposure
 after runtime extension changes
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, greentime.hu@sifive.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, inochiama@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_091220_702780_A73B4769 
X-CRM114-Status: GOOD (  21.09  )
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

T24gTW9uLCBKdW4gMSwgMjAyNiBhdCAzOjU24oCvUE0gWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFu
LndhbmdAc2lmaXZlLmNvbT4gd3JvdGU6Cj4KPiBGaXggYSBidWcgd2hlcmUgRldGVCBmZWF0dXJl
cyBjb3VsZCBiZSBpbmNvcnJlY3RseSBleHBvc2VkIHRvIGd1ZXN0cwo+IGFmdGVyIHVzZXJzcGFj
ZSBkaXNhYmxlcyB0aGVpciBkZXBlbmRlbnQgSVNBIGV4dGVuc2lvbnMgYXQgcnVudGltZS4KPgo+
IFRoZSAnc3VwcG9ydGVkJyBmaWVsZCBpbiBrdm1fc2JpX2Z3ZnRfY29uZmlnIHdhcyBzZXQgb25j
ZSBkdXJpbmcgdkNQVQo+IGluaXRpYWxpemF0aW9uIGJhc2VkIG9uIHRoZSBpbml0aWFsIGhhcmR3
YXJlL2V4dGVuc2lvbiBhdmFpbGFiaWxpdHkuCj4gSG93ZXZlciwgd2hlbiB1c2Vyc3BhY2Ugc3Vi
c2VxdWVudGx5IGRpc2FibGVzIElTQSBleHRlbnNpb25zIHZpYSB0aGUgS1ZNCj4gT05FX1JFRyBp
bnRlcmZhY2UsIHRoZSAnc3VwcG9ydGVkJyBmaWVsZCB3YXMgbm90IHVwZGF0ZWQuIFRoaXMgY2F1
c2VkCj4gdGhlIGZvbGxvd2luZyBpc3N1ZXM6Cj4gMS4gRldGVCBmZWF0dXJlcyB3b3VsZCByZW1h
aW4gdmlzaWJsZSBhbmQgYWNjZXNzaWJsZSB0byBndWVzdHMgZXZlbgo+ICAgIGFmdGVyIHRoZWly
IHByZXJlcXVpc2l0ZSBJU0EgZXh0ZW5zaW9ucyB3ZXJlIGRpc2FibGVkCj4gMi4gR3Vlc3RzIGNv
dWxkIGNvbmZpZ3VyZSBGV0ZUIGZlYXR1cmVzIHRoYXQgZGVwZW5kIG9uIGRpc2FibGVkCj4gICAg
ZXh0ZW5zaW9ucywgbGVhZGluZyB0byB1bmRlZmluZWQgYmVoYXZpb3IKPiAzLiBUaGUgc3RhdGlj
ICdzdXBwb3J0ZWQnIGZsYWcgYW5kIHRoZSBkeW5hbWljIHN1cHBvcnRlZCgpIGNhbGxiYWNrCj4g
ICAgY291bGQgZGlzYWdyZWUgYWJvdXQgZmVhdHVyZSBhdmFpbGFiaWxpdHkKPgo+IFRoZSBmaXgg
aW50cm9kdWNlcyBhIHR3by1sYXllciBjaGVja2luZyBtZWNoYW5pc206Cj4gMS4gQWRkIGFuIG9w
dGlvbmFsIGluaXQoKSBjYWxsYmFjayB0byB0aGUga3ZtX3NiaV9md2Z0X2ZlYXR1cmUgc3RydWN0
dXJlCj4gICAgZm9yIGZlYXR1cmVzIHRoYXQgcmVxdWlyZSBoYXJkd2FyZSBwcm9iaW5nIGR1cmlu
ZyBpbml0aWFsaXphdGlvbi4gVGhpcwo+ICAgIHNlcGFyYXRlcyB0aGUgb25lLXRpbWUgaGFyZHdh
cmUgZGV0ZWN0aW9uIGxvZ2ljIGZyb20gdGhlIHJ1bnRpbWUKPiAgICBhdmFpbGFiaWxpdHkgY2hl
Y2suCj4gMi4gQWRkIHJ1bnRpbWUgY2hlY2tzIGluIGFsbCBGV0ZULXJlbGF0ZWQgZnVuY3Rpb25z
IHRoYXQgY2FsbAo+ICAgIGZlYXR1cmUtPnN1cHBvcnRlZCh2Y3B1KSBpZiB0aGUgY2FsbGJhY2sg
ZXhpc3RzLiBUaGlzIGVuc3VyZXMgZmVhdHVyZQo+ICAgIGF2YWlsYWJpbGl0eSBpcyByZS1ldmFs
dWF0ZWQgYmFzZWQgb24gdGhlIGN1cnJlbnQgSVNBIGV4dGVuc2lvbiBzdGF0ZS4KPgo+IFRoaXMg
YXBwcm9hY2ggbWFpbnRhaW5zIHRoZSBjYWNoZWQgJ3N1cHBvcnRlZCcgZmllbGQgZm9yIGluaXRp
YWxpemF0aW9uLQo+IHRpbWUgZGVjaXNpb25zIHdoaWxlIGVuc3VyaW5nIHJ1bnRpbWUgYXZhaWxh
YmlsaXR5IGlzIGFsd2F5cyBkZXRlcm1pbmVkCj4gYnkgdGhlIGN1cnJlbnQgdkNQVSBjb25maWd1
cmF0aW9uLCBub3QgaW5pdGlhbGl6YXRpb24tdGltZSBzbmFwc2hvdHMuCj4KPiBGaXhlczogNmI3
MmZkMTcwNTkyICgiUklTQy1WOiBLVk06IGFkZCBzdXBwb3J0IGZvciBGV0ZUIFNCSSBleHRlbnNp
b24iKQo+Cj4gU2lnbmVkLW9mZi1ieTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lm
aXZlLmNvbT4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0
Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9zYmlfZndm
dC5jIHwgMTAgKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKQo+
Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYyBiL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+IGluZGV4IGFlZTk1MWYyYjhlNi4uYWIzOWFjNDY0ZmZk
IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3Yva3ZtL3ZjcHVfc2JpX2Z3ZnQuYwo+IEBAIC0zMDMsNiArMzAzLDggQEAgc3RhdGlj
IGludCBrdm1fZndmdF9nZXRfZmVhdHVyZShzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHUzMiBmZWF0
dXJlLAo+Cj4gICAgICAgICBpZiAoIXRjb25mLT5zdXBwb3J0ZWQgfHwgIXRjb25mLT5lbmFibGVk
KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gU0JJX0VSUl9OT1RfU1VQUE9SVEVEOwo+ICsgICAg
ICAgZWxzZSBpZiAodGNvbmYtPmZlYXR1cmUtPnN1cHBvcnRlZCAmJiAhdGNvbmYtPmZlYXR1cmUt
PnN1cHBvcnRlZCh2Y3B1KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIFNCSV9FUlJfTk9UX1NV
UFBPUlRFRDsKPgo+ICAgICAgICAgKmNvbmYgPSB0Y29uZjsKPgo+IEBAIC00MzMsNiArNDM1LDgg
QEAgc3RhdGljIHVuc2lnbmVkIGxvbmcga3ZtX3NiaV9leHRfZndmdF9nZXRfcmVnX2NvdW50KHN0
cnVjdCBrdm1fdmNwdSAqdmNwdSkKPiAgICAgICAgICAgICAgICAgY29uZiA9IGt2bV9zYmlfZndm
dF9nZXRfY29uZmlnKHZjcHUsIGZlYXR1cmUtPmlkKTsKPiAgICAgICAgICAgICAgICAgaWYgKCFj
b25mIHx8ICFjb25mLT5zdXBwb3J0ZWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgY29udGlu
dWU7Cj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKGNvbmYtPmZlYXR1cmUtPnN1cHBvcnRlZCAm
JiAhY29uZi0+ZmVhdHVyZS0+c3VwcG9ydGVkKHZjcHUpKQo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIGNvbnRpbnVlOwo+Cj4gICAgICAgICAgICAgICAgIHJldCsrOwo+ICAgICAgICAgfQo+IEBA
IC00NTUsNiArNDU5LDggQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9md2Z0X2dldF9yZWdfaWQo
c3RydWN0IGt2bV92Y3B1ICp2Y3B1LCBpbnQgaW5kZXgsIHU2NCAqcmUKPiAgICAgICAgICAgICAg
ICAgY29uZiA9IGt2bV9zYmlfZndmdF9nZXRfY29uZmlnKHZjcHUsIGZlYXR1cmUtPmlkKTsKPiAg
ICAgICAgICAgICAgICAgaWYgKCFjb25mIHx8ICFjb25mLT5zdXBwb3J0ZWQpCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgY29udGludWU7Cj4gKyAgICAgICAgICAgICAgIGVsc2UgaWYgKGNvbmYt
PmZlYXR1cmUtPnN1cHBvcnRlZCAmJiAhY29uZi0+ZmVhdHVyZS0+c3VwcG9ydGVkKHZjcHUpKQo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+Cj4gICAgICAgICAgICAgICAgIGlm
IChpbmRleCA9PSBpZHgpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAqcmVnX2lkID0gS1ZN
X1JFR19SSVNDViB8Cj4gQEAgLTQ5MCw2ICs0OTYsOCBAQCBzdGF0aWMgaW50IGt2bV9zYmlfZXh0
X2Z3ZnRfZ2V0X3JlZyhzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHUsIHVuc2lnbmVkIGxvbmcgcmVnX251
bQo+ICAgICAgICAgY29uZiA9IGt2bV9zYmlfZndmdF9nZXRfY29uZmlnKHZjcHUsIGZlYXR1cmUt
PmlkKTsKPiAgICAgICAgIGlmICghY29uZiB8fCAhY29uZi0+c3VwcG9ydGVkKQo+ICAgICAgICAg
ICAgICAgICByZXR1cm4gLUVOT0VOVDsKPiArICAgICAgIGVsc2UgaWYgKGNvbmYtPmZlYXR1cmUt
PnN1cHBvcnRlZCAmJiAhY29uZi0+ZmVhdHVyZS0+c3VwcG9ydGVkKHZjcHUpKQo+ICsgICAgICAg
ICAgICAgICByZXR1cm4gLUVOT0VOVDsKPgo+ICAgICAgICAgc3dpdGNoIChyZWdfbnVtIC0gZmVh
dHVyZS0+Zmlyc3RfcmVnX251bSkgewo+ICAgICAgICAgY2FzZSAwOgo+IEBAIC01MjcsNiArNTM1
LDggQEAgc3RhdGljIGludCBrdm1fc2JpX2V4dF9md2Z0X3NldF9yZWcoc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCB1bnNpZ25lZCBsb25nIHJlZ19udW0KPiAgICAgICAgIGNvbmYgPSBrdm1fc2JpX2Z3
ZnRfZ2V0X2NvbmZpZyh2Y3B1LCBmZWF0dXJlLT5pZCk7Cj4gICAgICAgICBpZiAoIWNvbmYgfHwg
IWNvbmYtPnN1cHBvcnRlZCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4gKyAg
ICAgICBlbHNlIGlmIChjb25mLT5mZWF0dXJlLT5zdXBwb3J0ZWQgJiYgIWNvbmYtPmZlYXR1cmUt
PnN1cHBvcnRlZCh2Y3B1KSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9FTlQ7Cj4KPiAg
ICAgICAgIHN3aXRjaCAocmVnX251bSAtIGZlYXR1cmUtPmZpcnN0X3JlZ19udW0pIHsKPiAgICAg
ICAgIGNhc2UgMDoKPgo+IC0tCj4gMi40My43Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
