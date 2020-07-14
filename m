Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68FB4C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 18:43:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37DDD225AA
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 18:43:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V3JKo+b7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="VqYEE3IP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 37DDD225AA
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=9agSASMFWl1JZwymhgyrQygi1Bu54OsKgQIX62vl9f0=; b=V3JKo+b73A6Q9intNLpT6bR2O
	60l8rg3BNDScM2QzLfVNRSwOy6Spx6LQA+AugVyvFcIDHj7Q/Z2oJSDFeLTcPkr1BXn09b9J3JGhE
	Ba4yq7l9UWOIxx4UtAiLYwaKYF0zL2J+b0Atix/L2i0cgvgV0cHIjlakZo2XYRVVboOncxib5IkG4
	GbaHzYY7372VY8gcyyQgaX7uPxsierfvN0P3T7gKuKnBulXRSoIcH+OM+HNoG1yHXI+hdWHHL17Z0
	funCWok+pLq8HP8gZQxYlxknt9sQ0K9eRefQpo1vhbi8xXA/psOs0NrWtV0+7UdV0DFE9xdis1a9l
	7WEugOPWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jvPth-0006EU-Km; Tue, 14 Jul 2020 18:43:21 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jvPte-0006Dj-4x
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 18:43:19 +0000
Received: by mail-pg1-x541.google.com with SMTP id j19so7952422pgm.11
 for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2020 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PSoCqSYVR+5FyIES+wNpKGXpQ6OMW93exMYtdsHXH4k=;
 b=VqYEE3IP8swNW+rXe3FApsMadhgHxhZy8ibBebKms2S7nKFFyNPBLEd6Rrue/Wv99e
 flXsbemj7CpKBYHX3MxvA67IKPUmppbSNT+gPgkFpNZ5qC3dQea/PXmw9FmNT3rqFJW6
 XidYvF/4kac1AeKE3xioGoL/1BwhhlJ+LcO0mpipTiSF5mDHNeGJDQNzmXGtTHlycY5I
 VbdMC9iNffDuRpABymuWbSjOGnv4B25/4AjOiBJ55fSam9EjCRStVnuI8UoJwY05u4UW
 ga3dV4mwHIGEglqHHwHXw80x4tF1T7GujKOADhgbtQYQItc+O+jB67qY4X8KCAxNW+r+
 8IiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PSoCqSYVR+5FyIES+wNpKGXpQ6OMW93exMYtdsHXH4k=;
 b=p7JMNGl48aIMVRxTBkA9P03LH70UB7SYdqxXZlCzsYH8ea5SrF0cPmuLENrRvsldct
 dMVxdaZTtHwCUOBF+xKLxJO5e78nwVv3NlMZkNeMuRr5qMZPNL8dHLqBo1xTDUK2pg8b
 xvP2jPMyPVj/HCjgfmBPB+BlHvYEmceivTd+eOtF6Gwtx9dqvVA16Ed81VAN9RILZuOl
 J/+F2hebCZnL3WBmDlfe3DCuwzwceUSuSQrkKMaSs5i+AMSr4x5YVN1aHSpSv9uiZtOV
 qSQ1vXXJ/NfUMmYlRISLU2b0xDfj89TiesI1aB3+IsY1SYmdY79WV3AjMKGkXUvktTaX
 Wy5Q==
X-Gm-Message-State: AOAM532nRu10pO8QbH4EQXn+t9TryGgrb5EF4EYaHBHVEsNlPAYhPhiE
 xdN3hY+R27NHweeS5LJs1u5Xig==
X-Google-Smtp-Source: ABdhPJwxHr5He73PpmJ7dhNXk0QtMbRcg41+cb1Z/AGCqiehbQOnK2uT3gPUge2Z3NVy2oAzpA9FOw==
X-Received: by 2002:a62:192:: with SMTP id 140mr5226967pfb.53.1594752195348;
 Tue, 14 Jul 2020 11:43:15 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d4sm17285706pgf.9.2020.07.14.11.43.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jul 2020 11:43:14 -0700 (PDT)
Date: Tue, 14 Jul 2020 11:43:14 -0700 (PDT)
X-Google-Original-Date: Tue, 14 Jul 2020 11:43:12 PDT (-0700)
Subject: Re: [PATCH V1 0/5] riscv: Add k/uprobe supported
In-Reply-To: <CAJF2gTSYyj5rTUJW-yDDrrV7T3hUssAhGc0gnCntcQpuixNJzw@mail.gmail.com>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-3921ee3a-6033-4f1c-9c93-ecdb5751b3b1@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200714_144318_786752_B5CF09E0 
X-CRM114-Status: GOOD (  26.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: penberg@gmail.com, me@packi.ch, guoren@linux.alibaba.com,
 anup@brainfault.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 Atish Patra <Atish.Patra@wdc.com>, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com,
 linux-riscv@lists.infradead.org, Bjorn Topel <bjorn.topel@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU2F0LCAwNCBKdWwgMjAyMCAwNzo1NToyOCBQRFQgKC0wNzAwKSwgZ3VvcmVuQGtlcm5lbC5v
cmcgd3JvdGU6Cj4gSGkgUGVra2EsCj4KPiBPbiBTYXQsIEp1bCA0LCAyMDIwIGF0IDI6NDAgUE0g
UGVra2EgRW5iZXJnIDxwZW5iZXJnQGdtYWlsLmNvbT4gd3JvdGU6Cj4+Cj4+IE9uIFNhdCwgSnVs
IDQsIDIwMjAgYXQgNjozNCBBTSA8Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+IFRoZSBw
YXRjaHNldCBpbmNsdWRlcyBrcHJvYmUvdXByb2JlIHN1cHBvcnQgYW5kIHNvbWUgcmVsYXRlZCBm
aXh1cHMuCj4+Cj4+IE5pY2UhCj4+Cj4+IE9uIFNhdCwgSnVsIDQsIDIwMjAgYXQgNjozNCBBTSA8
Z3VvcmVuQGtlcm5lbC5vcmc+IHdyb3RlOgo+PiA+IFRoZXJlIGlzIG5vIHNpbmdsZSBzdGVwIGV4
Y2VwdGlvbiBpbiByaXNjdiBJU0EsIHNvIHV0aWxpemUgZWJyZWFrIHRvCj4+ID4gc2ltdWxhdGUu
IFNvbWUgcGMgcmVsYXRlZCBpbnN0cnVjdGlvbnMgY291bGRuJ3QgYmUgZXhlY3V0ZWQgb3V0IG9m
IGxpbmUKPj4gPiBhbmQgc29tZSBzeXN0ZW0vZmVuY2UgaW5zdHJ1Y3Rpb25zIGNvdWxkbid0IGJl
IGEgdHJhY2Ugc2l0ZSBhdCBhbGwuCj4+ID4gU28gd2UgZ2l2ZSBvdXQgYSByZWplY3QgbGlzdCBh
bmQgc2ltdWxhdGUgbGlzdCBpbiBkZWNvZGUtaW5zbi5jLgo+Pgo+PiBDYW4geW91IGVsYWJvcmF0
ZSBvbiB3aGF0IHlvdSBtZWFuIGJ5IHRoaXM/IFdoeSB3b3VsZCB5b3UgbmVlZCBhCj4+IHNpbmds
ZS1zdGVwIGZhY2lsaXR5IGZvciBrcHJvYmVzPyBJcyBpdCBmb3IgZXhlY3V0aW5nIHRoZSBpbnN0
cnVjdGlvbgo+PiB0aGF0IHdhcyByZXBsYWNlZCB3aXRoIGEgcHJvYmUgYnJlYWtwb2ludD8KPgo+
IEl0J3MgdGhlIHNpbmdsZS1zdGVwIGV4Y2VwdGlvbiwgbm90IHNpbmdsZS1zdGVwIGZhY2lsaXR5
IQo+Cj4gT3RoZXIgYXJjaGVzIHVzZSBoYXJkd2FyZSBzaW5nbGUtc3RlcCBleGNlcHRpb24gZm9y
IGsvdXByb2JlLCAgZWc6Cj4gIC0gcG93ZXJwYzogcmVncy0+bXNyIHw9IE1TUl9TSU5HTEVTVEVQ
Cj4gIC0gYXJtL2FybTY0OiBQU1RBVEUuRCBmb3IgZW5hYmxpbmcgc29mdHdhcmUgc3RlcCBleGNl
cHRpb25zCj4gIC0gczM5MDogU2V0IFBFUiBjb250cm9sIHJlZ3MsIHR1cm5zIG9uIHNpbmdsZSBz
dGVwIGZvciB0aGUgZ2l2ZW4gYWRkcmVzcwo+ICAtIHg4NjogcmVncy0+ZmxhZ3MgfD0gWDg2X0VG
TEFHU19URgo+ICAtIGNza3k6IG9mIGNvdXJzZSB1c2UgaHcgc2luZ2xlIHN0ZXAgOikKPgo+IFll
cywgQWxsIHRoZSBhYm92ZSBhcmNoZXMgdXNlIGEgaGFyZHdhcmUgc2luZ2xlLXN0ZXAgZXhjZXB0
aW9uCj4gbWVjaGFuaXNtIHRvIGV4ZWN1dGUgdGhlIGluc3RydWN0aW9uIHRoYXQgd2FzIHJlcGxh
Y2VkIHdpdGggYSBwcm9iZQo+IGJyZWFrcG9pbnQuCgpJIGd1ZXNzIHdlIGNvdWxkIGhhbmRsZSBm
ZW5jZXMgYnkganVzdCBJUElpbmcgb3ZlciB0aGVyZSBhbmQgZXhlY3V0aW5nIHRoZQpmZW5jZT8g
IFByb2JhYmx5IG5vdCB3b3J0aCB0aGUgZWZmb3J0LCB0aG91Z2gsIGFzIGlmIHlvdSBoYXZlIGFu
IGlzc3VlIHRoYXQncwpzaG93aW5nIHVwIGNsb3NlIGVub3VnaCB0byBhIGZlbmNlIHRoYXQgeW91
IGNhbid0IGp1c3QgcHJvYmUgc29tZXdoZXJlIG5lYXJieQp0aGVuIHlvdSdyZSBwcm9iYWJseSBn
b2luZyB0byBkaXNydXB0IHRoaW5ncyB0b28gbXVjaCB0byBsZWFybiBhbnl0aGluZy4gIEknZAph
c3N1bWUgdGhhdCBBTU9zIGFyZSBhbHNvIHRvbyBtdWNoIG9mIGEgaGVhZGFjaGUgdG8gZW11bGF0
ZSwgYXMgbW92aW5nIHRoZW0gdG8KYSBkaWZmZXJlbnQgaGFydCB3b3VsZCBhbGxvdyBmb3IgZGlm
ZmVyZW50IG9yZGVyaW5ncyB0aGF0IG1heSBicmVhayB0aGluZ3MuCgpJIHN1cHBvc2UgdGhlIHRy
aWNrZXIgaXNzdWUgaXMgdGhhdCBpbnNlcnRpbmcgYSBwcm9iZSBpbiB0aGUgbWlkZGxlIG9mIGEg
TFIvU0MKc2VxdWVuY2Ugd2lsbCByZXN1bHQgaW4gYSBsb3NzIG9mIGZvcndhcmQgcHJvZ3Jlc3Mg
KG9yIG1heWJlIGV2ZW4gaW5jb3JyZWN0CmJlaGF2aW9yLCBpZiB5b3UgbWVzcyB1cCBhIHBhaXJp
bmcpLCBhcyB0aGVyZSBhcmUgZmFpcmx5IGhlYXZ5d2VpZ2h0CnJlc3RyaWN0aW9ucyBvbiB3aGF0
IHlvdSdyZSBhbGxvd2VkIHRvIGRvIGluc2lkZSB0aGVyZS4gIEkgZG9uJ3Qgc2VlIGFueQptZWNo
YW5pc20gZm9yIGhhbmRsaW5nIHRoaXMsIG1heWJlIHdlIG5lZWQgdG8gYnVpbGQgdXAgdGFibGVz
IG9mIHJlc3RyaWN0ZWQKcmVnaW9ucz8gIEFsbCB0aGUgTFIvU0Mgc2VxdWVuY2VzIHNob3VsZCBi
ZSBoaWRkZW4gYmVoaW5kIG1hY3JvcyBhbHJlYWR5LCBzbyBpdApzaG91bGRuJ3QgYmUgdGhhdCBo
YXJkIHRvIGZpZ3VyZSBpdCBvdXQuCgpJIG9ubHkgZ2F2ZSB0aGUgY29kZSBhIHF1aWNrIGxvb2ss
IGJ1dCBJIGRvbid0IHNlZSBhbnkgcmVmZXJlbmNlcyB0byBMUi9TQyBvcgpBTU8gc28gaWYgeW91
IGFyZSBoYW5kbGluZyB0aGVzZSBJIGd1ZXNzIHdlIGF0IGxlYXN0IG5lZWQgYSBjb21tZW50IDop
Cgo+Cj4+Cj4+IEFsc28sIHRoZSAiRGVidWcgU3BlY2lmaWNhdGlvbiIgWzFdIHNwZWNpZmllcyBh
IHNpbmdsZS1zdGVwIGZhY2lsaXR5Cj4+IGZvciBSSVNDLVYgLS0gd2h5IGlzIHRoYXQgbm90IHVz
ZWZ1bCBmb3IgaW1wbGVtZW50aW5nIGtwcm9iZXM/Cj4+Cj4+IDEuIGh0dHBzOi8vcmlzY3Yub3Jn
L3NwZWNpZmljYXRpb25zL2RlYnVnLXNwZWNpZmljYXRpb24vCj4gV2UgbmVlZCBzaW5nbGUtc3Rl
cCBleGNlcHRpb24gbm90IHNpbmdsZS1zdGVwIGJ5IGp0YWcsIHNvIGFib3ZlIHNwZWMKPiBpcyBu
b3QgcmVsYXRlZCB0byB0aGUgcGF0Y2hzZXQuCj4KPiBTZWUgcmlzY3YtUHJpdmlsZWdlZCBzcGVj
Ogo+Cj4gSW50ZXJydXB0IEV4Y2VwdGlvbiBDb2RlLURlc2NyaXB0aW9uCj4gMSAwIFJlc2VydmVk
Cj4gMSAxIFN1cGVydmlzb3Igc29mdHdhcmUgaW50ZXJydXB0Cj4gMSAy4oCTNCBSZXNlcnZlZAo+
IDEgNSBTdXBlcnZpc29yIHRpbWVyIGludGVycnVwdAo+IDEgNuKAkzggUmVzZXJ2ZWQKPiAxIDkg
U3VwZXJ2aXNvciBleHRlcm5hbCBpbnRlcnJ1cHQKPiAxIDEw4oCTMTUgUmVzZXJ2ZWQKPiAxIOKJ
pTE2IEF2YWlsYWJsZSBmb3IgcGxhdGZvcm0gdXNlCj4gMCAwIEluc3RydWN0aW9uIGFkZHJlc3Mg
bWlzYWxpZ25lZAo+IDAgMSBJbnN0cnVjdGlvbiBhY2Nlc3MgZmF1bHQKPiAwIDIgSWxsZWdhbCBp
bnN0cnVjdGlvbgo+IDAgMyBCcmVha3BvaW50Cj4gMCA0IExvYWQgYWRkcmVzcyBtaXNhbGlnbmVk
Cj4gMCA1IExvYWQgYWNjZXNzIGZhdWx0Cj4gMCA2IFN0b3JlL0FNTyBhZGRyZXNzIG1pc2FsaWdu
ZWQKPiAwIDcgU3RvcmUvQU1PIGFjY2VzcyBmYXVsdAo+IDAgOCBFbnZpcm9ubWVudCBjYWxsIGZy
b20gVS1tb2RlCj4gMCA5IEVudmlyb25tZW50IGNhbGwgZnJvbSBTLW1vZGUKPiAwIDEw4oCTMTEg
UmVzZXJ2ZWQKPiAwIDEyIEluc3RydWN0aW9uIHBhZ2UgZmF1bHQKPiAwIDEzIExvYWQgcGFnZSBm
YXVsdAo+IDAgMTQgUmVzZXJ2ZWQKPiAwIDE1IFN0b3JlL0FNTyBwYWdlIGZhdWx0Cj4gMCAxNuKA
kzIzIFJlc2VydmVkCj4gMCAyNOKAkzMxIEF2YWlsYWJsZSBmb3IgY3VzdG9tIHVzZQo+IDAgMzLi
gJM0NyBSZXNlcnZlZAo+IDAgNDjigJM2MyBBdmFpbGFibGUgZm9yIGN1c3RvbSB1c2UKPiAwIOKJ
pTY0IFJlc2VydmVkCj4KPiBObyBzaW5nbGUgc3RlcCEKPgo+IFNvIEkgaW5zZXJ0IGEgImVicmVh
ayIgaW5zdHJ1Y3Rpb24gYmVoaW5kIHRoZSB0YXJnZXQgc2luZ2xlLXN0ZXAKPiBpbnN0cnVjdGlv
biB0byBzaW11bGF0ZSB0aGUgc2FtZSBtZWNoYW5pc20uCgpTaW5nbGUgc3RlcCBpcyBwYXJ0IG9m
IHRoZSBkZWJ1ZyBzcGVjLiAgVGhhdCBtb3N0bHkgZGlzY3Vzc2VzIEpUQUcgZGVidWdnaW5nLApi
dXQgdGhlcmUncyBhbHNvIHNvbWUgc3R1ZmYgaW4gdGhlcmUgcmVsYXRlZCB0byBpbi1iYW5kIGRl
YnVnZ2luZyAoYXQgbGVhc3QKd2F0Y2ggcG9pbnRzIGFuZCBzaW5nbGUgc3RlcCwgdGhvdWdoIHRo
ZXJlIG1heSBiZSBtb3JlKS4gIElJUkMgeW91IGdldCBhCmJyZWFrcG9pbnQgZXhjZXB0aW9uIGFu
ZCB0aGVuIGNoYXNlIGFyb3VuZCBzb21lIENTUnMgdG8gZGlmZmVyZW50aWF0ZSBiZXR3ZWVuCnRo
ZSB2YXJpb3VzIHJlYXNvbnMsIGJ1dCBpdCdzIGJlZW4gYSB3aGlsZSBzaW5jZSBJJ3ZlIGxvb2tl
ZCBhdCB0aGlzIHN0dWZmLgoKSXQncyBhbGwga2luZCBvZiBpcnJlbGV2YW50LCB0aG91Z2gsIGFz
IHRoZXJlJ3Mgbm8gd2F5IHRvIGdldCBhdCBhbGwgdGhpcyBzdHVmZgpmcm9tIHN1cGVydmlzb3Ig
bW9kZS4gIEkgZG9uJ3Qgc2VlIGFueSByZWFzb24gd2UgY291bGRuJ3QgcHV0IHRvZ2V0aGVyIGFu
IFNCSQpleHRlbnNpb24gdG8gYWNjZXNzIHRoaXMgc3R1ZmYsIGJ1dCBJIGFsc28gZG9uJ3Qga25v
dyBhbnlvbmUgd2hvJ3MgbG9va2VkIGludG8KZG9pbmcgc28uICBUaGVyZSBhcmUgc29tZSBjb21w
bGV4aXRpZXMgaW52b2x2ZWQgYmVjYXVzZSB0aGlzIHN0YXRlIGlzIGFsbApzaGFyZWQgYmV0d2Vl
biBtYWNoaW5lIG1vZGUgYW5kIGRlYnVnIG1vZGUgdGhhdCB3ZSdkIG5lZWQgdG8gZGVhbCB3aXRo
LCBidXQgSQp0aGluayB3ZSBjb3VsZCBwdXQgc29tZXRoaW5nIHRvZ2V0aGVyIC0tIGF0IGxlYXN0
IGZvciBzaW5nbGUgc3RlcCB0aG9zZSBhcmUKZmFpcmx5IHN0cmFpZ2h0LWZvcndhcmQgaXNzdWVz
IHRvIGhhbmRsZS4KCj4gLS0gCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KPgo+IE1MOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9saW51eC1jc2t5LwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
