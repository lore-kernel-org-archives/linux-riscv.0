Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C3DCD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 08:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7QMSFuWkS8a8H1Yuk5yzKFdn9iNekpQI+4CK8ydNAN8=; b=Z5JDAfwcxe0AW0
	KRy2pXY4tIhKBQiOZkSkZTK58fKem+WKLQsVUHdK5rzzh6D0+EY2BblAOvrJCPYrx/lNt/c45Xxb/
	yIknNm7DmZZrW1ouNdjuL1DyYPnTkGpMZ1RAl3y/PadmrF/faY7Htz+oxoRqSmoNapGlxpGOGcfEq
	n4TqG3LuYS36dPUaxy6hBXzyMffs/wtff6WcdSF/x2cvyINDmtZbv5L6Fm433hzPeCapl5vLtMIgA
	EAA4zx3QKR87Sp7URCx951Li+FTjOhQsXHGdMCywv00QAujKmPFxmRQGATqlON1dNvK8TA6DZVwSg
	WFGdXNIQ4VbGskElB5ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoZ-0000000EYs5-35wc;
	Wed, 03 Jun 2026 08:19:03 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgoW-0000000EYp8-3X9X
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 08:19:02 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-7e6b5737bb2so3026315a34.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 01:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780474739; cv=none;
        d=google.com; s=arc-20240605;
        b=Yi1MdFTmbUzz7GTMCJT4v87jZQ+Z7cLtRENH6OGQXzk/WkD5I77uONuUupvdkPc9gi
         uGUbDmd3lRRYab/adLhyv6V1aa+DM+vbOEQl7fvWuwe/tBJhAzcd+t8NjOZZILlbImsz
         eh/+59SttY2WRRQ0VqxtYbeuW8ag3wjDyZYgvkhRfQcKsH+1xOndhQamc9bLa8rN15/X
         b4yarNa55SKr/2rHUbdrKjckf3QT8VSAkweYZdlldlnn0YlzQTpOT9l9Q02nNSHWPTUu
         L6/hpp9yaQdlUAaUEeZakbn0qeNfL4Qxwv9coxLinZxoJJd64zt+piflLCqv6mGHDc/4
         dpSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yygNmT61sYbCZArzAqt/fFbSogFcxsrnj7Jj0lk2HmA=;
        fh=6nhVHrFXG0ucvnBetXhkBOmXDOJES2ma7cvBATffwN0=;
        b=jrNWhDr8Ly86dhQXGbmJ6aM6VZPx4NZ2AVY9CE8X2eyonyUChFt+W3M1c00H1JRLEc
         vm0hBWtcEb4YplMWBJ/R7iqzaFUaT0moBs32UggDT5OdYPQjDFq7PnXBDpuSNmPCgL36
         bU8yq9tpNsNe+j2HE4ZGWGIanXN0kbvjvRx18qy7QpDwZffffSOGl+cdbc59BbjmjYYO
         +rf6FSM38LQv/AhCoA9a3LhhlvhWRFWLigAIHfqCUZcPtRElY3O4sXrlh9i/6zD9/Nr3
         NKwsBWy3tq0LNc9bGHxElQqJukyhVDApveLZY9q1vv9wzR81m6g5Ds1lg9n5sI2eqvDb
         3QfA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1780474739; x=1781079539; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yygNmT61sYbCZArzAqt/fFbSogFcxsrnj7Jj0lk2HmA=;
        b=TLLaq/4aFpKa0o7mLhirqi1VvJeZi3UtHi1xd0bdd4WRd6McwK9ewe04rXh3a/JzIs
         JG1HL28ss48YwfPrHHvWaUM8zkVsb4lXI3xmUQchgjEQ0kWisrGVUUiJvyMHvw1tvD/V
         iJjqiFcKV/HiiIS0ZuLYsio3T0IVHmktxd8B+4TZcPsecZeHH2wNSWRo+75DOGTI8ZlQ
         9LqmVa90ix+MQi/xyRIpvQ003WU/HFZuVSrCRh29MbSL1zSFvh3LKPnPO3WoyJCuEk/p
         ZHk0LIdEY/fiRPFx81GeiKWCtoX8GKZ2TwALYJrwdfUZdbcomqKSsd+eyusHx4+Cc4R1
         WblQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780474739; x=1781079539;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yygNmT61sYbCZArzAqt/fFbSogFcxsrnj7Jj0lk2HmA=;
        b=nJxOjEVH47Qd7oCjbNI0aTdUfW8Xwxbdwyxx8OQkE4/46pBLWK13obQ4M8RYe/r7pO
         EFoyVWtPvnirxIXgTrwkkB1KzG8Zwa+Jd8lcGszkCa1Z2M8Vln+tHtgAtjx0L23zH8sz
         FGkgUt9KcQJbw63Ug1469fDhhXHvZ5WBwvBtLUzEXNQwSQU5I9EVmWlQBogaxUSiaM2u
         WglqTEF2acaiT7l3snl4zqmhZoHQrvsR2Vu7+NZdgl9fSCciN2Y/vpsL/z8DiImGQhyc
         CjwMClMfzUvm8jw1OG+JgIcP6udO0RShXlUzUIEbR5YFdfcO2yFxIVTmIqbTI05N0aP8
         G5fQ==
X-Forwarded-Encrypted: i=1; AFNElJ8nAbgqIWti51rdl+xu/IXJ3c3fziUKzyHztItEB9wX4KQH4IYbEQDDFM0NiPhaGDHNqAq+SJYl63xXcw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw23wMAhaZoNJx10lDcVOQ8VRIZ7qL/WjXw5cPr1VE+GS8TT392
	eQLJUUcmQo6cChOGmblqrDiqdh8cZRirBYngeuTYzdA7FJRFLbDrCANY3p4dAqruDARGCkT4w++
	USB4QhfoxRMDqlWj07AGYUmtRMe+d0/XpaYioBJknRw==
X-Gm-Gg: Acq92OFFYrGt6wNMae1wQUKvIFViIPc9LrlpL/CEDitKevkTxWN2Jq/Z8dHs79K0PPt
	8sKU3+x2RYRTyR1xThL7AFI3z+gdR4gSuoFx0YCT4H9dsIYrmnZHr+I2nYJruJvj/O0hBU6oh/W
	i+7aMJfAu+Cs2Zezmd5gg2Yo029uRAEOUH3eD+uKQTbN02tEX9FaEEUtkCBSJ1KD4XelZXtTy8i
	HKxel3Bj39/jR8Zwup0WRx2oaTZ7bq0tt0obfOGf5RzWoRirjf9Z3zO79doeuKerCCTtL8T5D7e
	/sKET0ohMSzf+sVuobXsIs2UvA/V6ln1XPyu1nnTonoIta9x/7fwaWEbYlr2TMWFlzWwpTTXQRs
	xPkgV3ttwV8oziOutowPbsc4ghcmRTpAgICDGCQ==
X-Received: by 2002:a05:6820:280e:b0:69e:3e2a:a838 with SMTP id
 006d021491bc7-69e480c4e0amr960102eaf.52.1780474739437; Wed, 03 Jun 2026
 01:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn> <20260513154500183qjAlxzbei98Q4B5HjLpMx@zte.com.cn>
In-Reply-To: <20260513154500183qjAlxzbei98Q4B5HjLpMx@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 3 Jun 2026 13:48:47 +0530
X-Gm-Features: AVHnY4LzHljWBAXzMy2Za5hYWEvR0vWNkdwQN5CLSrLnlnj2h9dY2gFEIxQeMAA
Message-ID: <CAAhSdy13aO5b7rXfE4eNz+r8cLUhN3-T_YMegRPE2=15KCR1+Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] RISC-V: KVM: Add the eager_page_split module parameter
To: wang.yechao255@zte.com.cn
Cc: atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_011900_889805_E5F6E4BB 
X-CRM114-Status: GOOD (  19.90  )
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

T24gV2VkLCBNYXkgMTMsIDIwMjYgYXQgMToxNeKAr1BNIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPiB3cm90ZToKPgo+IEZyb206IFdhbmcgWWVjaGFvIDx3YW5nLnllY2hhbzI1NUB6dGUuY29t
LmNuPgo+Cj4gQWRkIGFuIGVhZ2VyX3BhZ2Vfc3BsaXQgbW9kdWxlIHBhcmFtZXRlciBmb3IgUklT
Qy1WIEtWTSwgZm9sbG93aW5nCj4gdGhlIHNhbWUgYXBwcm9hY2ggYXMgb24geDg2LiBUaGlzIHBh
cmFtZXRlciBjb250cm9scyB3aGV0aGVyIGVhZ2VyCj4gcGFnZSBzcGxpdHRpbmcgaXMgZW5hYmxl
ZC4gVGhlIGRlZmF1bHQgdmFsdWUgaXMgb24uCj4KPiBXaGVuIGVhZ2VyIHBhZ2Ugc3BsaXR0aW5n
IGlzIGVuYWJsZWQsIEtWTSBwcm9hY3RpdmVseSBzcGxpdHMgbGFyZ2UKPiBwYWdlcyAoaHVnZSBw
YWdlcykgaW50byBzbWFsbGVyIHBhZ2VzIHdoZW4gbmVlZGVkIGZvciBkaXJ0eSBsb2dnaW5nCj4g
b3Igb3RoZXIgb3BlcmF0aW9ucy4gRGlzYWJsaW5nIGl0IGNhbiBiZSBiZW5lZmljaWFsIGZvciBW
TSB3b3JrbG9hZHMKPiB0aGF0IHJhcmVseSBwZXJmb3JtIHdyaXRlcywgb3IgdGhhdCBvbmx5IHdy
aXRlIHRvIGEgc21hbGwgcmVnaW9uIG9mCj4gbWVtb3J5LCBhcyBpdCBhbGxvd3MgaHVnZSBwYWdl
cyB0byByZW1haW4gaW50YWN0IGZvciByZWFkIGFjY2Vzc2VzLgo+Cj4gU2lnbmVkLW9mZi1ieTog
V2FuZyBZZWNoYW8gPHdhbmcueWVjaGFvMjU1QHp0ZS5jb20uY24+CgpVcGRhdGUgRG9jdW1lbnRh
dGlvbi9hZG1pbi1ndWlkZS9rZXJuZWwtcGFyYW1ldGVycy50eHQgYXMgcGFydApvZiB0aGlzIHBh
dGNoLgoKUmVnYXJkcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlzY3Yva3ZtL21tdS5jIHwgMTMg
KysrKysrKysrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlz
Y3Yva3ZtL21tdS5jCj4gaW5kZXggMmNkZWEzZTNlZDRiLi4yYWYwM2M0OGFmZjMgMTAwNjQ0Cj4g
LS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+
IEBAIC0xNiw2ICsxNiw5IEBACj4gICNpbmNsdWRlIDxhc20va3ZtX21tdS5oPgo+ICAjaW5jbHVk
ZSA8YXNtL2t2bV9uYWNsLmg+Cj4KPiArYm9vbCBfX3JlYWRfbW9zdGx5IGVhZ2VyX3BhZ2Vfc3Bs
aXQgPSB0cnVlOwo+ICttb2R1bGVfcGFyYW0oZWFnZXJfcGFnZV9zcGxpdCwgYm9vbCwgMDY0NCk7
Cj4gKwo+ICBzdGF0aWMgdm9pZCBtbXVfd3BfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0s
IGludCBzbG90KQo+ICB7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX21lbXNsb3RzICpzbG90cyA9IGt2
bV9tZW1zbG90cyhrdm0pOwo+IEBAIC0xNDgsOCArMTUxLDEwIEBAIHZvaWQga3ZtX2FyY2hfbW11
X2VuYWJsZV9sb2dfZGlydHlfcHRfbWFza2VkKHN0cnVjdCBrdm0gKmt2bSwKPgo+ICAgICAgICAg
a3ZtX3Jpc2N2X2dzdGFnZV93cF9yYW5nZSgmZ3N0YWdlLCBzdGFydCwgZW5kKTsKPgo+IC0gICAg
ICAgaWYgKGt2bV9kaXJ0eV9sb2dfbWFudWFsX3Byb3RlY3RfYW5kX2luaXRfc2V0KGt2bSkpCj4g
LSAgICAgICAgICAgICAgIGt2bV9yaXNjdl9zcGxpdF9odWdlX3BhZ2VzKCZnc3RhZ2UsIHN0YXJ0
LCBlbmQsIHRydWUpOwo+ICsgICAgICAgaWYgKGt2bV9kaXJ0eV9sb2dfbWFudWFsX3Byb3RlY3Rf
YW5kX2luaXRfc2V0KGt2bSkpIHsKPiArICAgICAgICAgICAgICAgaWYgKFJFQURfT05DRShlYWdl
cl9wYWdlX3NwbGl0KSkKPiArICAgICAgICAgICAgICAgICAgICAgICBrdm1fcmlzY3Zfc3BsaXRf
aHVnZV9wYWdlcygmZ3N0YWdlLCBzdGFydCwgZW5kLCB0cnVlKTsKPiArICAgICAgIH0KPiAgfQo+
Cj4gIHZvaWQga3ZtX2FyY2hfc3luY19kaXJ0eV9sb2coc3RydWN0IGt2bSAqa3ZtLCBzdHJ1Y3Qg
a3ZtX21lbW9yeV9zbG90ICptZW1zbG90KQo+IEBAIC0yMTQsNyArMjE5LDkgQEAgdm9pZCBrdm1f
YXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbihzdHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgICAg
ICAgIGlmIChrdm1fZGlydHlfbG9nX21hbnVhbF9wcm90ZWN0X2FuZF9pbml0X3NldChrdm0pKQo+
ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiAgICAgICAgICAgICAgICAgbW11X3dw
X21lbW9yeV9yZWdpb24oa3ZtLCBuZXctPmlkKTsKPiAtICAgICAgICAgICAgICAga3ZtX3Jpc2N2
X3NwbGl0X21lbW9yeV9yZWdpb24oa3ZtLCBuZXctPmlkKTsKPiArCj4gKyAgICAgICAgICAgICAg
IGlmIChSRUFEX09OQ0UoZWFnZXJfcGFnZV9zcGxpdCkpCj4gKyAgICAgICAgICAgICAgICAgICAg
ICAga3ZtX3Jpc2N2X3NwbGl0X21lbW9yeV9yZWdpb24oa3ZtLCBuZXctPmlkKTsKPiAgICAgICAg
IH0KPiAgfQo+Cj4gLS0KPiAyLjI3LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
