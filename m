Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAF4C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 15 May 2024 23:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sZuWedh0HSOMLZlnRXFZb/27x29nOygySbPPoTRkHqM=; b=ysY3rVeyhRMIHW
	K908FR/qJvqiJRPt/RSMhzVT66RAmMRpQyehHikQC2Y1ZcitmAhRLWjhoDaRVQ2JznqaGZDqwvQF+
	yEdg8AUoKWWB6xlki4Cyd9WYpX3yRKp1yDZWWFvpI6cUKYLTGfWUbKANZeK6p1B6do/BhYLRBGUS5
	V1wnEPmffGcCcWX0TbVdSUZf7n+SFb7mCg6Lv+4QQ9RC+Ypm/mzrNmTDy3NKz70QjMQmfEct08Xl6
	6xv0jlJe3jvCP756P0J7hG7TzRUvvuxXYliO9DvGIVtJtWh6TQDDkd/S7mY7qRmHewNyR1TAg/0OA
	CH4RyThJ6go+8xQf1V8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NjY-000000036lA-08Cb;
	Wed, 15 May 2024 23:08:28 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7NjT-000000036jX-1qam
	for linux-riscv@lists.infradead.org;
	Wed, 15 May 2024 23:08:25 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f447976de7so6551951b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 May 2024 16:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1715814500; x=1716419300; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ke/O00Y/Kjm74N+9XrjAq0nbRjFhCTAJyeNXJqA3ng8=;
        b=aYY7mUJZOnAX+65uG1QyBFRk7Lz3A1v1SYmyAegBPgtcn05fp4cC1ryo6wTBc0VWs3
         Inj+7t5+M/FlbzDkpxPKRbvGxKYs34vqkvIebY1phhL/+XAST1QHIucH8Olmj/0pG3WY
         Bd3WoFIhc/GbBEc2irCfTMmRbl0EEfFu87pSODpjRR0Rx5hrQUUXIGQ7NOj9su11Yvvw
         8yAoY3IlzFQitH4za+QrNHyNkUkDaTBiDTJ1GdCXGyTV93tpkPNTlktF7jw1Z7wX6Uqf
         PYBOr8HwCnSJ7bdIdP9wc3orrmc5TsF01oXsNjggT4ksDE73fIu3czlo47CM/jhKFbgo
         r1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715814500; x=1716419300;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ke/O00Y/Kjm74N+9XrjAq0nbRjFhCTAJyeNXJqA3ng8=;
        b=xAVnMGB0dg1YSe2ES7XOuCKYEytxCpU5pRJIFAM41wRk4fsx1kr4KQzf3lLUHk/DS+
         +aNayzBjk7Yqtbo6kjw9U/g5nV4gVRJkle49wjfHtAl2Djoyii8mVaRVGYyoIl3ns9J4
         OMpJOkrLVlLOVTpS9QSNSicsbooGGjusE0XRP1wq90ielJ5iskny+zPAnpYGf+plDPA9
         CkudbygOQwbwvEuRHePi4U2BR457DXsS9PtU8yS+mf5J8f+LRrLfIcAd6/v9mCGqic5l
         vXhzx3l+kcPy7SPNqofC+14vSiFZz+v8yn+wmCFT5cyYoSrxNOLwx2Mhq3Hbf4mykXhN
         Mwjg==
X-Forwarded-Encrypted: i=1; AJvYcCXyiFOJOVtOGRAy0rGtfU2niC1620HbzZvtQ0B2PZj35I8UzlGr14NwwfVvEk/InA+TNGmX2vRqa5W6nEgCL7X3ddDYi9f7CBqy1zXwJSV/
X-Gm-Message-State: AOJu0YwhUxprErdFBS+Dht3LrfDMUPm9MSI3fsXgj68zgGB3EMSwxkef
	t+KLpghEKrnB4t5eLTIK624RUqfst0RG4TGdnFH1gYi54Ax5Ymi4Kvx1DNhJyaU=
X-Google-Smtp-Source: AGHT+IHTKntYjRB2czmnJQoB0Xk0pGWlCXePk30+bd9e9xQZBoHIBEfG3OP/NhLnJ8eL/896yjKHZg==
X-Received: by 2002:a05:6a00:174c:b0:6e7:b3c4:43a4 with SMTP id d2e1a72fcca58-6f4e035d2e8mr22362801b3a.25.1715814500626;
        Wed, 15 May 2024 16:08:20 -0700 (PDT)
Received: from ghost ([2601:647:5700:6860:144c:7973:ee0f:85cd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2b2f9eesm11664479b3a.212.2024.05.15.16.08.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 May 2024 16:08:19 -0700 (PDT)
Date: Wed, 15 May 2024 16:08:17 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Jessica Clarke <jrtc27@jrtc27.com>
Cc: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@sifive.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH 0/2] riscv: Allow vlenb to be probed from DT
Message-ID: <ZkVAYeNnvj99YHXt@ghost>
References: <20240515-add_vlenb_to_dt-v1-0-4ebd7cba0aa1@rivosinc.com>
 <A9EDD470-B8EC-4644-82A0-7444729EF885@jrtc27.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A9EDD470-B8EC-4644-82A0-7444729EF885@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_160823_678552_55D15550 
X-CRM114-Status: GOOD (  24.82  )
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

T24gV2VkLCBNYXkgMTUsIDIwMjQgYXQgMTE6MjU6MTZQTSArMDEwMCwgSmVzc2ljYSBDbGFya2Ug
d3JvdGU6Cj4gT24gMTUgTWF5IDIwMjQsIGF0IDIyOjUwLCBDaGFybGllIEplbmtpbnMgPGNoYXJs
aWVAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+IAo+ID4gVGhlIGtlcm5lbCBjdXJyZW50bHkgcmVx
dWlyZXMgYWxsIGhhcnRzIHRvIGhhdmUgdGhlIHNhbWUgdmFsdWUgaW4gdGhlCj4gPiB2bGVuYiBj
c3IgdGhhdCBpcyBwcmVzZW50IHdoZW4gYSBoYXJ0IHN1cHBvcnRzIHZlY3Rvci4gSW4gb3JkZXIg
dG8gcmVhZAo+ID4gdGhpcyBjc3IsIHRoZSBrZXJuZWwgbmVlZHMgdG8gYm9vdCB0aGUgaGFydC4g
QWRkaW5nIHZsZW5iIHRvIHRoZSBEVCB3aWxsCj4gPiBhbGxvdyB0aGUga2VybmVsIHRvIGRldGVj
dCB0aGUgaW5jb25zaXN0ZW5jeSBlYXJseSBhbmQgbm90IHdhc3RlIHRpbWUKPiA+IHRyeWluZyB0
byBib290IGhhcnRzIHRoYXQgaXQgZG9lc24ndCBzdXBwb3J0Lgo+IAo+IFRoYXQgZG9lc27igJl0
IHNlZW0gc3VmZmljaWVudCBqdXN0aWZpY2F0aW9uIHRvIG1lLiBJZiBpdCBjYW4gYmUgcmVhZAo+
IGZyb20gdGhlIGhhcmR3YXJlLCB3aHkgc2hvdWxkIHdlIGhhdmUgdG8gcHV0IGl0IGluIHRoZSBG
RFQ/IFRoZSB3aG9sZQo+IHBvaW50IG9mIHRoZSBGRFQgaXMgdG8gY29tbXVuaWNhdGUgdGhlIGhh
cmR3YXJlIGNvbmZpZ3VyYXRpb24gdGhhdAo+IGlzbuKAmXQgb3RoZXJ3aXNlIGRpc2NvdmVyYWJs
ZS4KClllcyB5b3UgYXJlIGNvcnJlY3QgaW4gdGhhdCB2bGVuYiBpcyBkaXNjb3ZlcmFibGUgb24g
YW55IGNvbmZvcm1pbmcKY2hpcC4gSG93ZXZlciwgdGhlIG1vdGl2YXRpb24gaGVyZSBpcyBmb3Ig
bWFraW5nIGRlY2lzaW9ucyBhYm91dCBob3cgdG8KYm9vdCBhIGhhcnQgYmVmb3JlIGl0IGlzIGJv
b3RlZC4gQnkgcGxhY2luZyBpdCBpbiB0aGUgZGV2aWNlIHRyZWUsIHdlCmFyZSBhYmxlIHRvIGRp
c2FibGUgdmVjdG9yIGJlZm9yZSB0aGUgY2hpcCBpcyBib290ZWQgaW5zdGVhZCBvZiB0cnlpbmcK
dG8gYm9vdCB0aGUgY2hpcCB3aXRoIHZlY3RvciBlbmFibGVkIG9ubHkgdG8gZGlzYWJsZSBpdCBs
YXRlci4gSW4gYm90aApjYXNlcyB3aGVuIHRoZXJlIGlzIGRpZmZlcmVudCB2bGVuYiBvbiBkaWZm
ZXJlbnQgaGFydHMsIGFsbCBoYXJ0cyBzdGlsbApib290IGFuZCB0aGUgb3V0Y29tZSBpcyB0aGF0
IHZlY3RvciBpcyBkaXNhYmxlZC4gVGhlIGRpZmZlcmVuY2UgaXMgdGhhdAp3aXRoIHRoZSBEVCBl
bnRyeSwgbm8gdmVjdG9yIHNldHVwIGNvZGUgbmVlZHMgdG8gYmUgcmFuIG9uIGEgYm9vdGluZwpo
YXJ0IHdoZW4gdGhlIG91dGNvbWUgd2lsbCBiZSB0aGF0IHZlY3RvciBpcyBub3QgZW5hYmxlZC4K
Cj4gCj4gQXMgZm9yIFQtSEVBRCBzdHVmZiwgaWYgdGhleSBuZWVkIGl0IHRoZXkgY2FuIGhhdmUg
YSBjdXN0b20gcHJvcGVydHkuCj4gVGhvdWdoIG5haXZlbHkgSeKAmWQgYXNzdW1lIHRoZXJl4oCZ
cyBhIHdheSB0byBhdm9pZCBpdCBzdGlsbC4uLgoKVC1IZWFkIGRvZXMgbm90IGV4cG9zZSB2bGVu
YiBvbiBhbGwgb2YgdGhlaXIgY2hpcHMgc28gSSBkbyBub3Qga25vdyBvZgphbnkgb3RoZXIgd2F5
IG9mIGdldHRpbmcgdGhlIHZsZW5iIHdpdGhvdXQgaGF2aW5nIGl0IGJlIHByb3ZpZGVkIGluIGEK
RFQuIFRoYXQgd2FzIHRoZSBtb3RpdmF0aW9uIGZvciB0aGlzIHBhdGNoIGluIHRoZSBmaXJzdCBw
bGFjZSwgYnV0Cm1ha2luZyB0aGlzIGF2YWlsYWJsZSB0byBhbGwgdmVuZG9ycyBhbGxvd3Mgb3B0
aW1pemF0aW9ucyB0byBoYXBwZW4KZHVyaW5nIGJvb3QuCgotIENoYXJsaWUKCj4gCj4gSmVzcwo+
IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
