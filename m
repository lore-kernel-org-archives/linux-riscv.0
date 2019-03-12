Return-Path: <SRS0=5v1j=RQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6CEC10F03
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 10:34:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B781B2171F
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2019 10:34:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oHEedM27";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OhAprC4U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Yd9ED5Hv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B781B2171F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=oracle.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Si7HWt0IiopjPuWdNzrfDk9H7O06oXjHW/Ja+1oKazg=; b=oHEedM27avdy5J
	CMXT1jCIgNMrEF8AC53jLlxqHu5ayUEl8yslb8V+9OWkXDezKuYkNfb4+kthOu2x/frzqYRS4eUT1
	YJ3c/2TgUbQZtfRhlyJPx1qraJx1Z4LDuOOEp0XB3fWeB2wzDT5xBT8r0RLejnbr1THmFE1UgtJzJ
	ehw03fNLgHeytTpAamJHBOT9Fry/paZM9TSl/qWHWyzZ25F8NCRp76z2aFmQjJFfvMpgmDnv8xFi7
	u812n68qRWsby+CEQVAxuWdri3S36tuBlPzaM5QhJ5eDKy3qeKuYaMejZ8NHKsHmQ+dFJXKYKzB2A
	fyyHy68x45TtPchRMMSA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h41DP-00059k-1Q; Wed, 13 Mar 2019 10:34:27 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h41Ac-0001eR-Vn; Wed, 13 Mar 2019 10:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QgBCqq5O+vEk+EovhRZ4bNYaRj3SLnZ6LwcqFgpHFoY=; b=OhAprC4UcXzbghHJqcTNAbrbD1
 ZEHUN7LE0fagJ7xvWG/cr817Zfk9D8HG8CMZ4Pgs/c1aMn1V7YE9T1uI6YSWoO8LKTpnFLc1omKD7
 7kln0PNNg1BWBBKzrO66WMeLo95QR3Khb0gHcrx0JURbMKegGZkQEw7toDFaBoFeyz/k0KSDu//4G
 aGkaObV+zF1venGzuYj+nlJeacitbmk+tp4yJu0ifoBWf0WGx8C6ZfuCttR0KZKKdl4bx0AbucEAU
 5vXg5CS+cOZeGkxqekx1OCcbCc82IgC8+rDc3p4xAinaK9qoYf6TCUO7Oalb6b0VXT0zux0tARXMl
 /WaUXp3w==;
Received: from userp2120.oracle.com ([156.151.31.85])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h3qYY-0007vx-Aq; Tue, 12 Mar 2019 23:11:35 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x2CMxUGw025289;
 Tue, 12 Mar 2019 23:09:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=QgBCqq5O+vEk+EovhRZ4bNYaRj3SLnZ6LwcqFgpHFoY=;
 b=Yd9ED5HvEZhNTJixatM3Gt97DoIo4xVIcolIdswY+cmTmVnoA4I7GxGSsbylcOc7prxm
 U0mlJ0ztRVKpswC3FTpjsa7QBA1wfc/JkBw9hVGpzIxkIMXTle5Gsf2urDKYiQXz7sKK
 LJUMqV8+ktDuERd4FJgom/ea+9Rowq70du6PtTn1y+d7RSVaRbytdIi6VUJ/33SEbzFU
 j40lifubaczC27OjH/OnSpoXtDQ+4F0OYVfQebI6tAdG6QBoZbygz8Qk2LKoWLhx99BQ
 PzQCcmuWJOkPNWoL8UelwzoQbLo+lPI3nhVui9GhrsqZECdWsI1yA2xTfcWyE2AL3peY Pg== 
Received: from userv0022.oracle.com (userv0022.oracle.com [156.151.31.74])
 by userp2120.oracle.com with ESMTP id 2r464rfq30-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Mar 2019 23:09:18 +0000
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userv0022.oracle.com (8.14.4/8.14.4) with ESMTP id x2CN9Ine019764
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Mar 2019 23:09:18 GMT
Received: from abhmp0017.oracle.com (abhmp0017.oracle.com [141.146.116.23])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x2CN9HWn019575;
 Tue, 12 Mar 2019 23:09:17 GMT
Received: from [10.182.69.106] (/10.182.69.106)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Mar 2019 16:09:17 -0700
Subject: Re: [Qemu-devel] ssh session with qemu-arm using busybox
To: Pintu Agarwal <pintu.ping@gmail.com>
References: <CAOuPNLgobR4ejPs_ZUuXpRwkURH0sfb1LD27TKhGg=wrwhUvZg@mail.gmail.com>
 <2c5d240eabdb56913f4abcc9aacf2b6b@mailhost.ics.forth.gr>
 <CAOuPNLg4dfoovZ_eqL5XvNW3Ak9dGeCVr=vbG6G5t4Rxo-nC9Q@mail.gmail.com>
 <00078ed3-fe1d-722e-0943-80bb189ee3ab@arm.com>
 <CAOuPNLhvPypbTU+AbodYTFdGHW_Uqxj4UQvo6usNCKZh30uTig@mail.gmail.com>
From: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <dde54d03-0231-6d3e-46ff-519df15fe077@oracle.com>
Date: Wed, 13 Mar 2019 07:12:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAOuPNLhvPypbTU+AbodYTFdGHW_Uqxj4UQvo6usNCKZh30uTig@mail.gmail.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=5900 definitions=9193
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1903120149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190312_191134_559341_0C5D1257 
X-CRM114-Status: GOOD (  24.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: kernelnewbies@kernelnewbies.org, Suzuki K Poulose <suzuki.poulose@arm.com>,
 open list <linux-kernel@vger.kernel.org>, qemu-devel@nongnu.org,
 Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org



On 3/13/19 1:08 AM, Pintu Agarwal wrote:
> On Tue, Mar 12, 2019 at 7:41 PM Suzuki K Poulose <suzuki.poulose@arm.com> wrote:
>>
>>
>>
>> On 12/03/2019 14:02, Pintu Agarwal wrote:
>>>>
>>>> -netdev user,id=unet,hostfwd=tcp::2222-:22 \
>>>> -net user \
>>>>
>>>> and you 'll get guest's port 22 to be forwarded to hosts port 2222, so
>>>> you can do
>>>>
>>>> ssh root@localhost:2222
>>>>
>>>> from the host.
>>>>
>>>
>>> I tried many different options, but unfortunately none worked for me.
>>> 1)
>>> qemu-system-arm -M vexpress-a9 -m 1024M -kernel
>>> ../KERNEL/linux/arch/arm/boot/zImage -dtb
>>> ../KERNEL/linux/arch/arm/boot/dts/vexpress-v2p-ca9.dtb -initrd
>>> rootfs.img.gz -append "console=ttyAMA0 root=/dev/ram rdinit=/sbin/init
>>> ip=dhcp" -nographic -smp 4 -netdev user,id=unet,hostfwd=tcp::2222-:22
>>> -net user
>>>
>>> With this the eth0 interface is removed, and I see this message
>>> (although login works):
>>> qemu-system-arm: warning: hub 0 with no nics
>>> qemu-system-arm: warning: netdev unet has no peer
>>> Booting Linux on physical CPU 0x0
>>> <skip>
>>> NET: Registered protocol family 17
>>> <skip>
>>> Run /sbin/init as init process
>>> ifconfig: SIOCSIFADDR: No such device
>>> route: SIOCADDRT: Network is unreachable
>>>
>>> But, ssh is still not working.
>>> ssh root@localhost:2222
>>> ssh: Could not resolve hostname localhost:2222: Name or service not known
>>
>> man ssh
>>
>> +
>>
>> Make sure you have sshd in your custom rootfs and has been stared.
>>
> 
> My busybox is a very minimal rootfs. It hardly contains any commands.
> Is there any precompiled busybox for arm (cpio image), available (with
> ssh, scp and networking in-built), which I can use directly to boot ?
> 
> what else I am missing to make ssh/scp working on qemu ?
> 

When I was working on arm binary rewriting/instrumentation in the university, I
use the image created by Linaro.

http://releases.linaro.org/

One example would be

https://www.linaro.org/blog/linaro-16-04-release-available-for-download-2/

or

https://releases.linaro.org/archive/ubuntu/images/developer-arm64/15.12/linaro-vivid-developer-20151215-114.tar.gz

The license should be good for academia. I do not know if there is any
restrictions on commercial/industry usage.

Thank for Linaro again for providing those images which helped me a lot when I
was in the university!

Dongli Zhang


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
