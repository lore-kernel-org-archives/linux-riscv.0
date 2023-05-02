Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89FEC7EE21
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8HZXXwd7Gp+aWZgjCQxBsu44X5jKG23i/YgyYc8+dQ=; b=0bhL7Eiow7m1e0
	ToQK9tbn9F4EsYBbCRp8mbfwt8lo0Bo97xWjhFZ7la1SbxBr3MIYQyOkLc/JX/UP3zJUX6XmYS+aA
	ZRojqTbfRKJ96RkO0cZgRhTWMOfUD3mJY2Ro/qzcND6g0Skbma5Eb5keyPw5/zPpvuK3TZ+H53VtA
	KPdtPgbivYoRta8J5foaOtWn2aRrT22L44mX5oKW7wIkthFemx0yNbf3wkqz2antsDKmtTFm7+Umt
	ZmBnbegmUTYFhrEFrccej52iN90nEnkDMoNtl80WszwPXi++0eLVfsOjBWJ+tr9nhSjRXdYuWqc7X
	Yw+kGDWBcokQ3qUPhrHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptm4c-000j74-0r;
	Tue, 02 May 2023 09:13:26 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptm4a-000j6a-09
	for linux-riscv@lists.infradead.org;
	Tue, 02 May 2023 09:13:25 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-50bc0ced1d9so4118001a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 May 2023 02:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vrull.eu; s=google; t=1683018801; x=1685610801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=je+stwVyVzohIMwhwEUkHHYxPgxc8l0tiX0YAlYbwa8=;
        b=S9eTIKXHQFsHNG2DDigtg+A94Kft9D3iwx2hQnQh1GTzcwuOJIuPqfp6zsZkV+8LJN
         CVVvFBpb2/PB9rA69X5DaXk/+n90Lx6RWnBmzRw84LnRGdw//09aCBRXMsLTfetNbfsL
         XoTBydUOfyeEqFfakYu//jz60rwxx9brShtYk2/jofkOCLTKMJRiY+e9bnn/Tz1OMP0K
         XEQgY4Gqt26+1h72oZbQ/mpxDmyyqaJJ00a6NfoxDO/4wySJjwO/q1oOH4LwehV3V3RH
         9lyo8rVCfZIfVN1I19H/Ey8MF14edZj2hMcOj775hKHhBLAfRR5mQDMwfwJuEm4+vKgt
         plMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683018801; x=1685610801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=je+stwVyVzohIMwhwEUkHHYxPgxc8l0tiX0YAlYbwa8=;
        b=EEz7rtFpIWUIZ4Nr+3HDxlMi9018CJePbV4SyOv9/J0djYVjWbPAIfD95abTPB3kLE
         EBBhW4FymejpcjYoAC7QfsFXyk4+xLxETPFYaoDRnDbuQAG6rFpX13HK2/1B4IQGmXHh
         oX1g1uKK8z5MaBUM8Zokk04PVjE8oAVHgMtnJS4gxK8LaS/+3GvJsdh2YkvzAmXoPpMu
         sJuAlfP4liW9N8fKApotXvkv54p0FT3C4oWbHaWdbu8ENLaSLfaFFIat/5aAcUSNJ4Ri
         /DOcu6oHkD9cWj7Piuj6s1cA5vxFB7JOuM//r6xzkTXwxx/zyyObaElRHhJFyYunwebD
         2BGA==
X-Gm-Message-State: AC+VfDyfFukbIjOtdovG50rp6QK1vca+of+AiiA2TqTuuAzK+afB9d+3
	SvQfc9EIdeEbTyYAF0OmsjehNKnGhg/NOY6O/AqH6Q==
X-Google-Smtp-Source: ACHHUZ5WzBNZvaHyJuQvxWvMJR3VHsNMHmkanBSzQ4QC8DfeJ+IWvHxYq1XJGkTwEG1UfMd183WkrJATar7m2pKDMzg=
X-Received: by 2002:a05:6402:441:b0:506:983f:1f61 with SMTP id
 p1-20020a056402044100b00506983f1f61mr7514391edw.3.1683018801471; Tue, 02 May
 2023 02:13:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <87ednz7roh.fsf@all.your.base.are.belong.to.us> <7DD2C38C-CBB3-41EE-A195-50E4C2451B7E@jrtc27.com>
 <CAAeLtUADqnwrgBjhDd+iNfwhMU6YBiMUZzeopVMAh0Jq19W9JA@mail.gmail.com> <87jzxrnp01.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87jzxrnp01.fsf@all.your.base.are.belong.to.us>
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
Date: Tue, 2 May 2023 11:13:10 +0200
Message-ID: <CAAeLtUCqyARVaY2YtVXWc_cucMOCbQ2RAd2y35pun_MMagEN_w@mail.gmail.com>
Subject: Re: [PATCH 0/4] Expose the isa-string via the AT_BASE_PLATFORM aux vector
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, Heiko Stuebner <heiko@sntech.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Kito Cheng <kito.cheng@sifive.com>, 
	Conor Dooley <conor.dooley@microchip.com>, matthias.bgg@gmail.com, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Greentime Hu <greentime.hu@sifive.com>, 
	nick.knight@sifive.com, christoph.muellner@vrull.eu, 
	richard.henderson@linaro.org, arnd@arndb.de, linux-kernel@vger.kernel.org, 
	Heiko Stuebner <heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230502_021324_087430_5CC7FDC2 
X-CRM114-Status: GOOD (  20.16  )
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

T24gVHVlLCAyIE1heSAyMDIzIGF0IDA5OjU4LCBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IFBoaWxpcHAgVG9tc2ljaCA8cGhpbGlwcC50b21zaWNoQHZydWxsLmV1
PiB3cml0ZXM6Cj4KPiA+IEl0IGlzIGEgcGl0eSB0aGF0IHRoZSBjdXJyZW50IGludGVyZmFjZSB3
YXMgZGVzaWduZWQgd2l0aG91dCBpbnZvbHZpbmcKPiA+IFJWSSAoYW5kIHRoYXQgSSBoYWQgdG8g
YXNrIG15IHRlYW0gdG8gcHV0IHRvZ2V0aGVyIGEgcGF0Y2ggc2V0IGZvcgo+ID4gZnVydGhlciBk
aXNjdXNzaW9uLCBnaXZlbiB0aGF0IG5vbmUgb2YgdGhlIG90aGVyIG1ham9yIHZlbmRvcnMgaW4g
UlZJCj4gPiBzdGVwcGVkIGZvcndhcmQpLiAgSSBndWFyYW50ZWUgdGhhdCBwbGVudHkgb2YgcmV2
aWV3ZXJzIHdvdWxkIGhhdmUKPiA+IGhpZ2hsaWdodGVkIHRoYXQgYSBjZW50cmFsIHJlZ2lzdHJ5
IChldmVuIGlmIGl0IGlzIGp1c3QgYSBrZXJuZWwKPiA+IGhlYWRlcikgc2hvdWxkIGJlIGF2b2lk
ZWQuCj4KPiBBcmUgeW91IGNsYWltaW5nIHRoYXQgdGhlIGh3cHJvYmUgd29yayB3YXMgbm90IGRv
bmUgaW4gdGhlIG9wZW4sIGJ1dAo+IHNlY3JldGx5IG1lcmdlZD8gVGhhdCBpcyBub3Qgb25seSBp
bmNvcnJlY3QsIGJ1dCBydWRlIHRvIHVwc3RyZWFtIFJJU0MtVgo+IExpbnV4IGRldmVsb3BlcnMu
IEkgc3VnZ2VzdCB5b3UgcmV2aWV3IGhvdyB5b3UgaW50ZXJhY3Qgd2l0aCB1cHN0cmVhbQo+IGtl
cm5lbCB3b3JrLgoKUGxlYXNlIGRvbid0IHB1dCB3b3JkcyBpbnRvIG15IG1vdXRoLi4uCgpJIHdh
cyBtZXJlbHkgcG9pbnRpbmcgb3V0IHRoYXQgdGhlcmUgd2FzIG5vIGVuZ2FnZW1lbnQgYnkgdGhl
IFJWSQptZW1iZXIgY29tcGFuaWVzIChpbiByZWdhcmQgdG8gdGhpcyBtZWNoYW5pc20pIHdpdGhp
biBSVkksIHdoaWNoIHdvdWxkCmhhdmUgcHJldmVudGVkIEplc3NpY2EncyBpc3N1ZS4KVGhpcyB3
b3VsZCBoYXZlIGFsc28gaGVscGVkIHRvIGFkZHJlc3MgdGhlIGNvbmNlcm5zIG9uIHZlbmRvci1k
ZWZpbmVkCmV4dGVuc2lvbnMuCgpBbHNvIHdobyBkbyB5b3UgcmVmZXIgdG8gd2hlbiB5b3Ugc2F5
ICJob3cgX3lvdV8gaW50ZXJhY3QiPyAgSWYgaXQgaXMKUlZJIHRoYXQgeW91IHJlZmVyIHRvOiBp
dCBkb2Vzbid0IGludGVyYWN0IHdpdGggdXBzdHJlYW0gd29yawpkaXJlY3RseSwgYXMgaXQgZG9l
c24ndCBvd24gYW55IGVuZ2luZWVyaW5nIHJlc291cmNlcy4KUlZJIHByb3ZpZGVzIGEgZm9ydW0g
Zm9yIG1lbWJlciBjb21wYW5pZXMgdG8gY29tZSB0byBhbgp1bmRlcnN0YW5kaW5nL2Rlc2lnbiBh
bmQgdGhlbiBoYXZlIHRoZSBtZW1iZXIgY29tcGFuaWVzIHBlcmZvcm0gdGhlCndvcmsgYW5kIHRh
a2UgaXQgdXBzdHJlYW0uCgo+IFdoeSBkaWRuJ3QgUlZJIGdldCBpbnZvbHZlZCBpbiB0aGUgcmV2
aWV3IG9mIHRoZSBzZXJpZXM/IFRoZSBleHBlY3RhdGlvbgo+IGNhbm5vdCBiZSB0aGF0IGFsbCBv
cGVuIHNvdXJjZSBwcm9qZWN0cyBnbyB0byBSVkksIGJ1dCByYXRoZXIgdGhlIG90aGVyCj4gd2F5
IGFyb3VuZC4KClRoYXQgaXMgZXhhY3RseSB0aGUgcG9pbnQgSSB3YXMgbWFraW5nIGFuZCB3aGlj
aCB5b3Ugc2VlbSB0byBtaXNzOiBSVkkKZG9lcyBub3Qgb3duIGFueSBlbmdpbmVlcmluZyByZXNv
dXJjZXMgYW5kIGRlcGVuZHMgc29sZWx5IG9uIGl0cwptZW1iZXIgY29tcGFuaWVzIHRvIHByb2pl
Y3QgaW50byBvcGVuIHNvdXJjZSBwcm9qZWN0cy4KCj4gVGFrZSBhIGxvb2sgYXQgY29tbWl0IGVh
M2RlOWNlOGFhMiAoIlJJU0MtVjogQWRkIGEgc3lzY2FsbCBmb3IgSFcKPiBwcm9iaW5nIikuIFlv
dXIgdGVhbSB3YXMgdmVyeSBtdWNoIGludm9sdmVkIGluIHRoZSByZXZpZXcuCgpJIGFtIGF3YXJl
LCBhcyBJIGhhZCByZXZpZXdlZCBhbmQgY29tbWVudGVkIG9uIHRoZXNlIGFyZSB3ZWxsLgpBbmQg
bXkgb25seSByZXF1ZXN0ICh3YXMgYW5kKSBpcyB0aGF0IHdlIG5lZWQgdG8gZmlndXJlIG91dCBh
IHdheSB0bwplZmZpY2llbnRseSBkZWFsIHdpdGggdmVuZG9yLWRlZmluZWQgZXh0ZW5zaW9ucy4K
CkNoZWVycywKUGhpbGlwcC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
