Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C4AC32793
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jan 2023 23:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Bd2TB3lOABJhVzmKXEgNx47zSHYy1mhWNF7TgsmFSY=; b=JnI+t5LirUMSaU
	XgjR/EncKoTrj1HLeNiez5BlAJxWlBp0jl4ADoHfYraDh1tzyBXYCP+1D2c5p+wK+u6lnt93dRchw
	Ms9pSFbJlKCDlVxlBGT0+0H4vz6ooYISxgZvgemIPRDnYodKEtvJoWsgjMkB38ytpJ1LYKZPiqz/g
	3VSrJz4B3uPOagtTcR5YZ2rcIXW0xKWFn01FxmLU+ybpuN0fMQFVlbY/ynHIm850iKsxaUK1pbd0T
	M9GaLUwz37enzdMHfoD0oRGtDYVAF1Xjw9CPRi0v7sbWdmOoJrfvsI4x0WdF3Elicb+FqNJr8LKO0
	iI8+1yAXk6YBaR88BLUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIHiH-002waB-57; Wed, 18 Jan 2023 23:19:25 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIHiD-002wZG-Lw
	for linux-riscv@lists.infradead.org; Wed, 18 Jan 2023 23:19:23 +0000
Received: by mail-pj1-x102b.google.com with SMTP id x2-20020a17090a46c200b002295ca9855aso4092545pjg.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jan 2023 15:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K9Yw1dDzEg29HUd/WuRUgZJfGX/RT7S/Bo0mzAWnWJk=;
        b=L7EtwNkm3GfK9KDmZM8iiBTqkFnroNqU94ipZ2ey4z1AG1xCIoByIo+zZYwiOlYy0I
         W4hWkl1QLRJ/wScc4f0i2hTxJdtutWLvhlAbvbHnoG41WV1MfQFRTeTTJXDFOIeahbms
         U47qiDdKAhdtxPdoxQjquES5R3C+32jvdBS2C1Y4t/hZlud4eSfy9CCqS/pvD2Ey074x
         mYFRSam7uP8kFjtNaMCTbOjeYW8b2Mj8LFf88UfDN+5A6xcymYXLC8tX3Qe5ttX1iPAJ
         Y/nSw0pd2dFQhi+ee/ZUVb2xfSih8231dAR/+igj7ONbWjyfnyUIdiVC108MEEyAtn/E
         9xQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K9Yw1dDzEg29HUd/WuRUgZJfGX/RT7S/Bo0mzAWnWJk=;
        b=7XC4nPa+CmxpibXgXOodDnlwxYVAgqwMrHV2wKT7bg1PtZgqbmH3mlTp3gKZwW41tR
         f8O7bOOPHs03xKtiKQPl9+TJA0lvWkg8cq5wr3CaAtplgW5pakWSzn7K05+4N3ZgXk43
         Q05KQ4cYtyDAnjoE9/UqAwomwuNMapNBFHaLCTWAMT1ehznXAmyt8sfi0ni6DSPdualN
         EATanxM2m2gANXoSzN4bYsDtUuYmlxHcXudloAuP6ecZjPsibyOWv3IEB5GcqEwQmYnJ
         Bn11scQWAoxUoMh6YLPn7+xVObmF5b75iQwB4PD2uqdr2eDtU+CdnYs6tvTQwV+Z+ScF
         I0ew==
X-Gm-Message-State: AFqh2kqMkG5qHwtdStzsoUG6dj7XLS0Ams0L6KYEzeDaAvXhM0c9t4xN
	3trfcqA2ebLFW3OIKfKVVT8ZIA==
X-Google-Smtp-Source: AMrXdXscmrxsowA8TyEJv6Vz36cEASQ3Q8G6D5/38r+WuVk+32LVTVik+YABa3AC0m4fctwdjB4nYw==
X-Received: by 2002:a05:6a20:2a93:b0:af:8e92:411c with SMTP id v19-20020a056a202a9300b000af8e92411cmr39271142pzh.44.1674083957664;
        Wed, 18 Jan 2023 15:19:17 -0800 (PST)
Received: from [192.168.50.116] (c-24-4-73-83.hsd1.ca.comcast.net. [24.4.73.83])
        by smtp.gmail.com with ESMTPSA id h15-20020a17090a3d0f00b00226d4009505sm1852430pjc.3.2023.01.18.15.19.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 15:19:17 -0800 (PST)
Message-ID: <c2177e4e-e97d-448a-73e7-c50622fdc4bb@rivosinc.com>
Date: Wed, 18 Jan 2023 15:19:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Vineet Gupta <vineetg@rivosinc.com>
Subject: Re: [PATCH v2] riscv: elf: add .riscv.attributes parsing
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@kernel.org>, Greentime Hu <greentime.hu@sifive.com>,
 Conor Dooley <conor.dooley@microchip.com>, linux@rivosinc.com
References: <20230112210622.2337254-1-vineetg@rivosinc.com>
 <D6A37757-DB22-44C6-A906-D68A0B8BD7A6@jrtc27.com>
Content-Language: en-US
In-Reply-To: <D6A37757-DB22-44C6-A906-D68A0B8BD7A6@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_151921_948882_C9DDAEE9 
X-CRM114-Status: GOOD (  17.03  )
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

CgpPbiAxLzEyLzIzIDE0OjM4LCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBPbiAxMiBKYW4gMjAy
MywgYXQgMjE6MDYsIFZpbmVldCBHdXB0YTx2aW5lZXRnQHJpdm9zaW5jLmNvbT4gIHdyb3RlOgoK
Pj4gK3N0YXRpYyBpbnQKPj4gK2RlY29kZV91bGViMTI4X3NhZmUodW5zaWduZWQgY2hhciAqKmRw
cCwgdTMyICp2YWwsIGNvbnN0IHVuc2lnbmVkIGNoYXIgKnBfZW5kKQo+PiArewo+PiArCXVuc2ln
bmVkIGNoYXIgKmJwID0gKmRwcDsKPj4gKwl1bnNpZ25lZCBjaGFyIGJ5dGU7Cj4+ICsJdW5zaWdu
ZWQgaW50IHNoaWZ0ID0gMDsKPj4gKwl1MzIgcmVzdWx0ID0gMDsKClZlZCBjb21tZW50ZWQgb2Zm
LWxpc3QgYWJvdXQgdTMyIGJlaW5nIHdpZGUgZW5vdWdoLiBTbyBJJ2xsIGJlIG1ha2luZyAKQHZh
bCB1NjQgZXZlcnl3aGVyZS4KCj4+ICsJaW50IG9rID0gMDsKPj4gKwo+PiArCXdoaWxlIChicCA8
IHBfZW5kKSB7Cj4+ICsJCWJ5dGUgPSAqYnArKzsKPj4gKwkJcmVzdWx0IHw9IChieXRlICYgMHg3
ZikgPDwgc2hpZnQ7Cj4+ICsJCWlmICgoYnl0ZSAmIDB4ODApID09IDApIHsKPj4gKwkJCW9rID0g
MTsKPj4gKwkJCWJyZWFrOwo+IFdoeSBub3QganVzdCBkbyB0aGUgcmV0dXJuIGhlcmU/CgpJIGd1
ZXNzwqAgSSBjb3VsZC4KCj4+ICsKPj4gKwljYXNlIFJWX0FUVFJfVEFHX2FyY2g6Cj4+ICsJCXN0
ciA9IHA7Cj4+ICsJCXNfbGVuID0gc3RybmxlbihwLCBwX2VuZCAtIHApICsgMTsKPj4gKwkJcCAr
PSBzX2xlbjsKPj4gKwkJaWYgKHAgPiBwX2VuZCkKPiBDb25zdHJ1Y3Rpbmcgc3VjaCBhIHAgaXMg
VUIsIGNoZWNrIHNfbGVuIGJlZm9yZSBpbnN0ZWFkLgoKT0suCgoKPj4gKwkJCWdvdG8gYmFkX2F0
dHI7Cj4+ICsJCXJ2X2VsZl9hdHRyX3N0cih0YWcsIHN0cik7Cj4+ICsJCWJyZWFrOwo+PiArCj4+
ICsJZGVmYXVsdDoKPj4gKwkJaWYgKGRlY29kZV91bGViMTI4X3NhZmUoJnAsICZ2YWwsIHBfZW5k
KSkKPiAgRnJvbSB0aGUgcmF0aWZpZWQgc3BlYzoKPgo+ICAgICJSSVNDLVYgYXR0cmlidXRlcyBo
YXZlIGEgc3RyaW5nIHZhbHVlIGlmIHRoZSB0YWcgbnVtYmVyIGlzIG9kZCBhbmQgYW4gaW50ZWdl
ciB2YWx1ZSBpZiB0aGUgdGFnIG51bWJlciBpcyBldmVuLiIKCk9LLCBhZGRlZCBzYW5pdHkgY2hl
Y2tzLgoKCj4KPj4gKwo+PiArCW1lbXNldChidWYsIDAsIFJWX0FUVFJfU0VDX1NaKTsKPiBUaGlz
IHdpbGwgaGlkZSBidWdzIGZyb20gc2FuaXRpc2Vycy4uLgoKQW5kIGlmIGtlcm5lbF9yZWFkKCkg
ZmlsbHMgaXQgcGFydGlhbGx5LCBsZWF2ZSB0aGUgcmVzdCB1bmluaXRpYWxpemVkID8KSSdsbCBr
ZWVwIHRoZSBtZW1zZXQuCgo+PiArCXBvcyA9IHBoZHItPnBfb2Zmc2V0Owo+PiArCW4gPSBrZXJu
ZWxfcmVhZChmLCAmYnVmLCBwaGRyLT5wX2ZpbGVzeiwgJnBvcyk7Cj4+ICsKPj4gKwlpZiAobiA8
IDApCj4+ICsJCXJldHVybiAtRUlPOwo+PiArCj4+ICsJcCA9IGJ1ZjsKPj4gKwlwX2VuZCA9IHAg
KyBuOwo+PiArCj4+ICsJLyogc2FuaXR5IGNoZWNrIGZvcm1hdC12ZXJzaW9uICovCj4+ICsJaWYg
KCpwKysgIT0gJ0EnKQo+IFdoYXQgaWYgbiBpcyAwPwoKSSBjYW4gY2hlY2sgZm9yIG4gPD0gMCBh
Ym92ZS4KCj4+ICsJCWdvdG8gYmFkX2VsZjsKPj4gKwo+PiArCS8qCj4+ICsJICogZWxmIGF0dHJp
YnV0ZSBzZWN0aW9uIG9yZ2FuaXplZCBhcyBWZW5kb3Igc3ViLXNlY3Rpb25zKHMpCj4+ICsJICog
ICB7c3ViLXNlY3Rpb24gbGVuZ3RoLCB2ZW5kb3IgbmFtZSwgdmVuZG9yIGRhdGF9Cj4+ICsJICog
VmVuZG9yIGRhdGEgb3JnYW5pemVkIGFzIHN1Yi1zdWJzZWN0aW9uKHMpCj4+ICsJICogICB7dGFn
LCBzdWItc3Vic2VjdGlvbiBsZW5ndGgsIGF0dHJpYnV0ZXMgY29udGVudHN9Cj4+ICsJICogQXR0
cmlidXRlIGNvbnRlbnRzIG9yZ2FuaXplZCBhcwo+PiArCSAqICAge3RhZywgdmFsdWV9IHBhaXIo
cykuCj4+ICsJICovCj4+ICsJd2hpbGUgKChwX2VuZCAtIHApID49IDQpIHsKPj4gKwkJaW50IHN1
Yl9sZW4sIHZuYW1lX2xlbjsKPiB1MzI/CgpPSy4KCj4+ICsKPj4gKwkJc3ViX2xlbiA9IGdldF91
bmFsaWduZWRfbGUzMihwKTsKPj4gKwkJaWYgKHN1Yl9sZW4gPD0gNCB8fCBzdWJfbGVuID4gbikK
PiBuIGlzIHRoZSB0b3RhbCBhbW91bnQgcmVhZCBpbiwgbm90IHRoZSByZW1haW5pbmcgYW1vdW50
LgoKRml4ZWQgdG8gc3ViX2xlbiA+IChwX2VuZCAtIHApCgo+Cj4+ICsKPj4gKwkJLyogVmVuZG9y
IGRhdGE6IHN1Yi1zdWJzZWN0aW9ucyhzKSAqLwo+PiArCQl3aGlsZSAoc3ViX2xlbiA+IDApIHsK
Pj4gKwkJCXUzMiB0YWcsIGNvbnRlbnRfbGVuOwo+PiArCQkJdW5zaWduZWQgY2hhciAqc3ViX2Vu
ZCwgKnN1Yl9zdGFydCA9IHA7Cj4gQ29uZnVzaW5nIG5hbWluZyBmb3Igc3ViLXN1YnNlY3Rpb24g
dmFyaWFibGVzLgoKRmFpciBlbm91Z2g6IHBfc3Nfc3RhcnQsIHBfc3NfZW5kLCBzc19sZW4KClRo
eC4KLVZpbmVldAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
